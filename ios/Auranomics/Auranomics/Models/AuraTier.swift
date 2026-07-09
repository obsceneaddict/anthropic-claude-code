import SwiftUI

enum AuraTier: Int, CaseIterable, Comparable {
    case shadow = 0
    case flicker = 1
    case glow = 2
    case radiant = 3
    case legendary = 4

    static func < (lhs: AuraTier, rhs: AuraTier) -> Bool { lhs.rawValue < rhs.rawValue }

    /// Total lifetime aura score required to reach this tier.
    var threshold: Int {
        switch self {
        case .shadow: return Int.min
        case .flicker: return 2_000
        case .glow: return 8_000
        case .radiant: return 20_000
        case .legendary: return 50_000
        }
    }

    var label: String {
        switch self {
        case .shadow: return "Shadow"
        case .flicker: return "Flicker"
        case .glow: return "Glow"
        case .radiant: return "Radiant"
        case .legendary: return "Legendary"
        }
    }

    var emoji: String {
        switch self {
        case .shadow: return "🌑"
        case .flicker: return "🕯️"
        case .glow: return "🌟"
        case .radiant: return "☀️"
        case .legendary: return "👑"
        }
    }

    var gradient: [Color] {
        switch self {
        case .shadow: return [Color(hex: "3A3A45"), Color(hex: "1C1C22")]
        case .flicker: return [Color(hex: "6C6CE5"), Color(hex: "2E2E7A")]
        case .glow: return [Color(hex: "5AC8FA"), Color(hex: "4A6CF7")]
        case .radiant: return [Color(hex: "FF5AA5"), Color(hex: "A66CFF")]
        case .legendary: return [Color(hex: "FFD34D"), Color(hex: "FF8A3D")]
        }
    }

    static func tier(for totalScore: Int) -> AuraTier {
        AuraTier.allCases.reversed().first { totalScore >= $0.threshold } ?? .shadow
    }

    /// Points needed to reach the next tier, nil if already at the top.
    func pointsToNext(currentScore: Int) -> Int? {
        guard let next = AuraTier(rawValue: rawValue + 1) else { return nil }
        return max(0, next.threshold - currentScore)
    }

    var next: AuraTier? { AuraTier(rawValue: rawValue + 1) }
}
