import Foundation

struct PresetEvent: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let emoji: String
    let points: Int
    let category: AuraCategory
}

enum PresetEventLibrary {

    static let all: [PresetEvent] = [
        // Confidence
        PresetEvent(title: "Wore a fit that went hard", emoji: "🔥", points: 2500, category: .confidence),
        PresetEvent(title: "Walked in like I owned the place", emoji: "🚶", points: 1800, category: .confidence),
        PresetEvent(title: "Said no without explaining myself", emoji: "🙅", points: 1500, category: .confidence),
        PresetEvent(title: "Posted the photo I almost deleted", emoji: "📸", points: 1200, category: .confidence),
        PresetEvent(title: "Made eye contact and didn't look away first", emoji: "👀", points: 900, category: .confidence),

        // Social
        PresetEvent(title: "Made the whole room laugh", emoji: "😂", points: 3000, category: .social),
        PresetEvent(title: "Remembered someone's name from once", emoji: "🧠", points: 800, category: .social),
        PresetEvent(title: "Held the door and got a genuine thank you", emoji: "🚪", points: 500, category: .social),
        PresetEvent(title: "Left them on read on purpose", emoji: "📵", points: 800, category: .social),
        PresetEvent(title: "Group chat went silent after my message", emoji: "💬", points: -600, category: .social),

        // Love
        PresetEvent(title: "They texted first", emoji: "💌", points: 2200, category: .love),
        PresetEvent(title: "Sent the risky text and it landed", emoji: "🎯", points: 2600, category: .love),
        PresetEvent(title: "Got left on read", emoji: "👻", points: -1400, category: .love),
        PresetEvent(title: "Caught them staring", emoji: "😳", points: 1900, category: .love),
        PresetEvent(title: "Overthought a text for 20 minutes", emoji: "😵‍💫", points: -700, category: .love),

        // Chaos
        PresetEvent(title: "Hit every green light", emoji: "🚦", points: 1300, category: .chaos),
        PresetEvent(title: "Found money in an old jacket", emoji: "💸", points: 1600, category: .chaos),
        PresetEvent(title: "Phone survived the drop", emoji: "📱", points: 1100, category: .chaos),
        PresetEvent(title: "Missed the bus by two seconds", emoji: "🚌", points: -900, category: .chaos),
        PresetEvent(title: "WiFi died mid-presentation", emoji: "📡", points: -1700, category: .chaos),

        // Fails
        PresetEvent(title: "Tripped in public, played it cool", emoji: "🤸", points: -1200, category: .fails),
        PresetEvent(title: "Spilled coffee on myself before a meeting", emoji: "☕", points: -1000, category: .fails),
        PresetEvent(title: "Said 'you too' when the waiter said enjoy your meal", emoji: "🫠", points: -1800, category: .fails),
        PresetEvent(title: "Waved back at someone who wasn't waving at me", emoji: "🙋", points: -2200, category: .fails),
        PresetEvent(title: "Forgot why I walked into the room", emoji: "🚪", points: -400, category: .fails),
        PresetEvent(title: "Laughed at my own joke, nobody else did", emoji: "🎤", points: -1500, category: .fails),
    ]

    static func events(for category: AuraCategory) -> [PresetEvent] {
        all.filter { $0.category == category }
    }
}
