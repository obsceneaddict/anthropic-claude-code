import Foundation

@Observable
final class HomeViewModel {
    let repository: AuraRepository

    var showLogSheet = false
    var showReveal = false
    var showPaywall = false
    var lastLoggedEvent: AuraEvent?

    init(repository: AuraRepository) {
        self.repository = repository
    }

    var totalScore: Int { repository.totalScore }
    var todayScore: Int { repository.todayScore }
    var tier: AuraTier { repository.tier }
    var streak: Int { repository.currentStreak }
    var todayEvents: [AuraEvent] { repository.todayEvents }

    var progressToNextTier: Double {
        guard let next = tier.next else { return 1.0 }
        let lower = tier.threshold == Int.min ? 0 : tier.threshold
        let span = Double(next.threshold - lower)
        guard span > 0 else { return 1.0 }
        return min(1.0, max(0.0, Double(totalScore - lower) / span))
    }

    func didLog(_ event: AuraEvent) {
        repository.add(event)
        lastLoggedEvent = event
        showLogSheet = false
        showReveal = true
        HapticsService.success()
        Analytics.shared.log(.eventLogged(category: event.category.rawValue, isCustom: event.isCustom, points: event.points))
    }
}
