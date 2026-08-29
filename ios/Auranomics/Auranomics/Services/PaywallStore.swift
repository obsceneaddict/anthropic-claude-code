import Foundation
import StoreKit

struct AuraPlan: Identifiable, Hashable {
    let id: String
    let title: String
    let priceLabel: String
    let subLabel: String
    let badge: String?
}

/// Real StoreKit 2 entitlement store. No backend, no receipt server — Apple
/// is the source of truth via `Transaction.currentEntitlements` /
/// `Transaction.updates`. Works against:
///   1. A local `.storekit` configuration file selected in the Xcode scheme
///      (Product → Scheme → Edit Scheme → Options → StoreKit Configuration)
///      for testing before App Store Connect products exist/are approved.
///   2. Real App Store Connect products once they're "Ready to Submit" —
///      no code changes needed, just remove the local config from the scheme.
///
/// Product IDs must exactly match `Constants.IAP` and what you create in
/// App Store Connect.
@Observable
final class PaywallStore {
    private let defaultsKey = "auranomics.isPro"

    var isPro: Bool {
        didSet { UserDefaults.standard.set(isPro, forKey: defaultsKey) }
    }

    var isPurchasing = false
    var lastError: String?
    private(set) var storeProducts: [Product] = []

    /// Fallback display metadata shown before StoreKit products finish loading
    /// (e.g. cold start, or before App Store Connect products are approved).
    /// Real prices from `Product.displayPrice` override these once available,
    /// already localized to the user's storefront currency.
    private let planMetadata: [AuraPlan] = [
        AuraPlan(id: Constants.IAP.monthly, title: "Monthly", priceLabel: "19,99 zł", subLabel: "per month", badge: nil),
        AuraPlan(id: Constants.IAP.yearly, title: "Yearly", priceLabel: "99,99 zł", subLabel: "≈ 8,33 zł/mo · save 58%", badge: "BEST VALUE"),
        AuraPlan(id: Constants.IAP.lifetime, title: "Lifetime", priceLabel: "149 zł", subLabel: "one-time, forever", badge: nil)
    ]

    var plans: [AuraPlan] {
        planMetadata.map { meta in
            guard let product = storeProducts.first(where: { $0.id == meta.id }) else { return meta }
            return AuraPlan(id: meta.id, title: meta.title, priceLabel: product.displayPrice, subLabel: meta.subLabel, badge: meta.badge)
        }
    }

    private var transactionListener: Task<Void, Never>?

    init() {
        isPro = UserDefaults.standard.bool(forKey: defaultsKey)
        transactionListener = listenForTransactionUpdates()
        Task { [weak self] in
            await self?.loadProducts()
            await self?.refreshEntitlements()
        }
    }

    deinit {
        transactionListener?.cancel()
    }

    @MainActor
    func loadProducts() async {
        do {
            storeProducts = try await Product.products(for: [
                Constants.IAP.monthly, Constants.IAP.yearly, Constants.IAP.lifetime
            ])
        } catch {
            lastError = "Couldn't load products: \(error.localizedDescription)"
        }
    }

    func purchase(_ plan: AuraPlan) async {
        isPurchasing = true
        lastError = nil
        defer { isPurchasing = false }

        guard let product = storeProducts.first(where: { $0.id == plan.id }) else {
            lastError = "This product isn't available yet. Try again in a moment."
            Analytics.shared.log(.purchaseFailed(plan: plan.id))
            return
        }

        do {
            let result = try await product.purchase()
            switch result {
            case .success(let verification):
                let transaction = try Self.checkVerified(verification)
                await refreshEntitlements()
                await transaction.finish()
                Analytics.shared.log(.purchaseCompleted(plan: plan.id))
            case .userCancelled:
                break
            case .pending:
                lastError = "Purchase is pending approval (e.g. Ask to Buy)."
            @unknown default:
                break
            }
        } catch {
            lastError = error.localizedDescription
            Analytics.shared.log(.purchaseFailed(plan: plan.id))
        }
    }

    func restore() async {
        isPurchasing = true
        defer { isPurchasing = false }
        try? await AppStore.sync()
        await refreshEntitlements()
    }

    @MainActor
    private func refreshEntitlements() async {
        let proProductIDs: Set<String> = [Constants.IAP.monthly, Constants.IAP.yearly, Constants.IAP.lifetime]
        var hasActiveEntitlement = false

        for await result in Transaction.currentEntitlements {
            guard let transaction = try? Self.checkVerified(result) else { continue }
            if proProductIDs.contains(transaction.productID) && transaction.revocationDate == nil {
                hasActiveEntitlement = true
            }
        }
        isPro = hasActiveEntitlement
    }

    private func listenForTransactionUpdates() -> Task<Void, Never> {
        Task.detached { [weak self] in
            for await result in Transaction.updates {
                guard let self, let transaction = try? Self.checkVerified(result) else { continue }
                await self.refreshEntitlements()
                await transaction.finish()
            }
        }
    }

    private static func checkVerified<T>(_ result: VerificationResult<T>) throws -> T {
        switch result {
        case .unverified:
            throw StoreError.failedVerification
        case .verified(let safe):
            return safe
        }
    }

    private enum StoreError: Error {
        case failedVerification
    }
}
