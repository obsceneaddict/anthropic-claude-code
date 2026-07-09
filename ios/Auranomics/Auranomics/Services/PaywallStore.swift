import Foundation

struct AuraPlan: Identifiable, Hashable {
    let id: String
    let title: String
    let priceLabel: String
    let subLabel: String
    let badge: String?
}

/// MVP entitlement store. `isPro` is persisted locally and flipped by the
/// mock `purchase(_:)` call below so the paywall is fully testable without
/// App Store Connect being set up yet.
///
/// TODO before shipping: replace `purchase`/`restore` with real StoreKit 2:
///   - Product.products(for:) to fetch `AuraPlan.id`s as real product identifiers
///   - `product.purchase()`, verify `VerificationResult`, listen to `Transaction.updates`
///   - Mirror the entitlement into `isPro` from `Transaction.currentEntitlements`
/// Keep product IDs in Constants.swift so App Store Connect and code stay in sync.
@Observable
final class PaywallStore {
    private let defaultsKey = "auranomics.isPro"

    var isPro: Bool {
        didSet { UserDefaults.standard.set(isPro, forKey: defaultsKey) }
    }

    var isPurchasing = false
    var lastError: String?

    let plans: [AuraPlan] = [
        AuraPlan(id: Constants.IAP.monthly, title: "Monthly", priceLabel: "19,99 zł", subLabel: "per month", badge: nil),
        AuraPlan(id: Constants.IAP.yearly, title: "Yearly", priceLabel: "99,99 zł", subLabel: "≈ 8,33 zł/mo · save 58%", badge: "BEST VALUE"),
        AuraPlan(id: Constants.IAP.lifetime, title: "Lifetime", priceLabel: "149 zł", subLabel: "one-time, forever", badge: nil)
    ]

    init() {
        isPro = UserDefaults.standard.bool(forKey: defaultsKey)
    }

    func purchase(_ plan: AuraPlan) async {
        isPurchasing = true
        lastError = nil
        defer { isPurchasing = false }

        // MOCK: simulate network/StoreKit round trip. Replace with real StoreKit 2 call.
        try? await Task.sleep(nanoseconds: 700_000_000)
        isPro = true
        Analytics.shared.log(.purchaseCompleted(plan: plan.id))
    }

    func restore() async {
        isPurchasing = true
        defer { isPurchasing = false }
        try? await Task.sleep(nanoseconds: 500_000_000)
        // MOCK: in production, re-sync from Transaction.currentEntitlements.
    }
}
