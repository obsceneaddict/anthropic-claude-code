import SwiftUI

enum AuraCategory: String, Codable, CaseIterable, Identifiable {
    case confidence
    case social
    case love
    case chaos
    case fails

    var id: String { rawValue }

    var label: String {
        switch self {
        case .confidence: return "Confidence"
        case .social: return "Social"
        case .love: return "Love"
        case .chaos: return "Chaos"
        case .fails: return "Fails"
        }
    }

    var emoji: String {
        switch self {
        case .confidence: return "✨"
        case .social: return "👥"
        case .love: return "💜"
        case .chaos: return "🎲"
        case .fails: return "💀"
        }
    }

    var tint: Color {
        switch self {
        case .confidence: return Color(hex: "FFC542")
        case .social: return Color(hex: "5AC8FA")
        case .love: return Color(hex: "FF5AA5")
        case .chaos: return Color(hex: "A66CFF")
        case .fails: return Color(hex: "FF4D4D")
        }
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb & 0xFF0000) >> 16) / 255
        let g = Double((rgb & 0x00FF00) >> 8) / 255
        let b = Double(rgb & 0x0000FF) / 255
        self.init(red: r, green: g, blue: b)
    }
}
