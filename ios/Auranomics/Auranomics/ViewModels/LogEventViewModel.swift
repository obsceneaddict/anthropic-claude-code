import Foundation

@Observable
final class LogEventViewModel {
    private let repository: AuraRepository
    private let paywall: PaywallStore

    var customText: String = ""
    var suggestedPoints: Int?
    var suggestedCategory: AuraCategory?
    var didHitPaywall = false

    let presets = PresetEventLibrary.all

    init(repository: AuraRepository, paywall: PaywallStore) {
        self.repository = repository
        self.paywall = paywall
    }

    var canLogMoreCustomToday: Bool {
        paywall.isPro || repository.customEntriesToday < Constants.Limits.freeCustomEntriesPerDay
    }

    var remainingFreeCustomEntries: Int {
        max(0, Constants.Limits.freeCustomEntriesPerDay - repository.customEntriesToday)
    }

    func makeEvent(from preset: PresetEvent) -> AuraEvent {
        AuraEvent(title: preset.title, emoji: preset.emoji, points: preset.points, category: preset.category, isCustom: false)
    }

    /// Runs the scoring engine against `customText` and stores the suggestion for preview.
    func evaluateCustomText() {
        guard canLogMoreCustomToday else {
            didHitPaywall = true
            return
        }
        let result = AuraScoringEngine.score(for: customText)
        suggestedPoints = result.points
        suggestedCategory = result.category
    }

    func makeCustomEvent() -> AuraEvent? {
        guard canLogMoreCustomToday else {
            didHitPaywall = true
            return nil
        }
        guard let points = suggestedPoints, let category = suggestedCategory,
              !customText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return nil }
        let emoji = points >= 0 ? "✨" : "💀"
        let event = AuraEvent(title: customText, emoji: emoji, points: points, category: category, isCustom: true)
        customText = ""
        suggestedPoints = nil
        suggestedCategory = nil
        return event
    }
}
