import Foundation

@Observable
final class PaywallViewModel {
    let store: PaywallStore
    var selectedPlan: AuraPlan?
    let trigger: String

    init(store: PaywallStore, trigger: String = "unknown") {
        self.store = store
        self.trigger = trigger
        self.selectedPlan = store.plans.first { $0.badge != nil } ?? store.plans.first
        Analytics.shared.log(.paywallShown(trigger: trigger))
    }

    var plans: [AuraPlan] { store.plans }
    var isPurchasing: Bool { store.isPurchasing }

    func select(_ plan: AuraPlan) {
        selectedPlan = plan
        HapticsService.selectionChanged()
    }

    func confirmPurchase() async {
        guard let plan = selectedPlan else { return }
        await store.purchase(plan)
    }

    func restore() async {
        await store.restore()
    }
}
