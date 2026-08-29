import Foundation

@Observable
final class HistoryViewModel {
    let repository: AuraRepository
    let paywall: PaywallStore

    init(repository: AuraRepository, paywall: PaywallStore) {
        self.repository = repository
        self.paywall = paywall
    }

    /// Free tier only sees the last N days; Pro sees everything.
    var visibleDays: [(date: Date, events: [AuraEvent])] {
        let calendar = Calendar.current
        let daysBack = paywall.isPro ? 365 : Constants.Limits.freeHistoryDays
        let scoped = repository.events(inLastDays: daysBack)

        let grouped = Dictionary(grouping: scoped) { calendar.startOfDay(for: $0.date) }
        return grouped
            .map { (date: $0.key, events: $0.value.sorted { $0.date > $1.date }) }
            .sorted { $0.date > $1.date }
    }

    var weekScore: Int { repository.weekScore }
    var categoryBreakdown: [(category: AuraCategory, total: Int)] { repository.categoryBreakdown(inLastDays: 7) }
    var biggestGain: AuraEvent? { repository.biggestGainThisWeek }
    var biggestLoss: AuraEvent? { repository.biggestLossThisWeek }
    var isHistoryLimited: Bool { !paywall.isPro }
}
