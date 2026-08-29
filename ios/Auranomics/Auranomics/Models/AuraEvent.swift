import Foundation

struct AuraEvent: Identifiable, Codable, Equatable {
    let id: UUID
    var title: String
    var emoji: String
    var points: Int
    var category: AuraCategory
    var date: Date
    var isCustom: Bool

    init(
        id: UUID = UUID(),
        title: String,
        emoji: String,
        points: Int,
        category: AuraCategory,
        date: Date = Date(),
        isCustom: Bool = false
    ) {
        self.id = id
        self.title = title
        self.emoji = emoji
        self.points = points
        self.category = category
        self.date = date
        self.isCustom = isCustom
    }

    var isGain: Bool { points >= 0 }

    var formattedPoints: String {
        let sign = points >= 0 ? "+" : ""
        return "\(sign)\(points.formatted())"
    }
}
