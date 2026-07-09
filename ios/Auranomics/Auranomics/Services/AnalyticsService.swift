import Foundation

/// Minimal analytics seam. Ship the console logger for MVP / TestFlight,
/// swap `Analytics.shared` for a real SDK (e.g. TelemetryDeck, PostHog, Firebase)
/// once you have a privacy policy entry for it. Keep event names stable —
/// they double as your funnel definitions (see docs/STRATEGY.md Część 4.15).
protocol AnalyticsServicing {
    func log(_ event: AnalyticsEvent)
}

enum AnalyticsEvent {
    case onboardingCompleted
    case eventLogged(category: String, isCustom: Bool, points: Int)
    case shareCardExported
    case paywallShown(trigger: String)
    case purchaseCompleted(plan: String)
    case purchaseFailed(plan: String)

    var name: String {
        switch self {
        case .onboardingCompleted: return "onboarding_completed"
        case .eventLogged: return "aura_event_logged"
        case .shareCardExported: return "share_card_exported"
        case .paywallShown: return "paywall_shown"
        case .purchaseCompleted: return "purchase_completed"
        case .purchaseFailed: return "purchase_failed"
        }
    }
}

struct ConsoleAnalyticsService: AnalyticsServicing {
    func log(_ event: AnalyticsEvent) {
        #if DEBUG
        print("[Analytics] \(event.name) — \(event)")
        #endif
    }
}

enum Analytics {
    static let shared: AnalyticsServicing = ConsoleAnalyticsService()
}
