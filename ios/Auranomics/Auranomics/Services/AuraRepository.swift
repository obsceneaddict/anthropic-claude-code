import Foundation

/// Local, offline-first persistence + derived stats for aura events.
/// Stores a flat JSON file in the app's Documents directory — no backend,
/// no login, nothing that needs a privacy nutrition label entry beyond
/// "data stored only on device".
@Observable
final class AuraRepository {
    private(set) var events: [AuraEvent] = []

    private let fileURL: URL

    init(fileName: String = "aura_events.json") {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        fileURL = documents.appendingPathComponent(fileName)
        load()
    }

    // MARK: - Mutations

    func add(_ event: AuraEvent) {
        events.append(event)
        save()
    }

    func remove(_ event: AuraEvent) {
        events.removeAll { $0.id == event.id }
        save()
    }

    func deleteAll() {
        events.removeAll()
        save()
    }

    // MARK: - Queries

    func events(on date: Date) -> [AuraEvent] {
        let calendar = Calendar.current
        return events
            .filter { calendar.isDate($0.date, inSameDayAs: date) }
            .sorted { $0.date > $1.date }
    }

    func events(inLastDays days: Int) -> [AuraEvent] {
        let cutoff = Calendar.current.date(byAdding: .day, value: -days, to: Date()) ?? .distantPast
        return events.filter { $0.date >= cutoff }.sorted { $0.date > $1.date }
    }

    var todayEvents: [AuraEvent] { events(on: Date()) }

    var customEntriesToday: Int {
        todayEvents.filter(\.isCustom).count
    }

    // MARK: - Derived stats

    var totalScore: Int { events.reduce(0) { $0 + $1.points } }

    var todayScore: Int { todayEvents.reduce(0) { $0 + $1.points } }

    var weekScore: Int { events(inLastDays: 7).reduce(0) { $0 + $1.points } }

    var tier: AuraTier { AuraTier.tier(for: totalScore) }

    /// Consecutive days (including today, if logged) with at least one entry.
    var currentStreak: Int {
        let calendar = Calendar.current
        let daysWithEntries = Set(events.map { calendar.startOfDay(for: $0.date) })
        guard !daysWithEntries.isEmpty else { return 0 }

        var streak = 0
        var cursor = calendar.startOfDay(for: Date())

        // If nothing logged today yet, streak counting still starts from yesterday
        // so a user doesn't lose their streak just by not having opened the app yet today.
        if !daysWithEntries.contains(cursor) {
            cursor = calendar.date(byAdding: .day, value: -1, to: cursor) ?? cursor
        }

        while daysWithEntries.contains(cursor) {
            streak += 1
            guard let previous = calendar.date(byAdding: .day, value: -1, to: cursor) else { break }
            cursor = previous
        }
        return streak
    }

    func categoryBreakdown(inLastDays days: Int) -> [(category: AuraCategory, total: Int)] {
        let scoped = events(inLastDays: days)
        return AuraCategory.allCases.map { category in
            (category, scoped.filter { $0.category == category }.reduce(0) { $0 + $1.points })
        }
        .sorted { abs($0.total) > abs($1.total) }
    }

    var biggestGainThisWeek: AuraEvent? {
        events(inLastDays: 7).max { $0.points < $1.points }
    }

    var biggestLossThisWeek: AuraEvent? {
        events(inLastDays: 7).min { $0.points < $1.points }
    }

    // MARK: - Persistence

    private func load() {
        guard let data = try? Data(contentsOf: fileURL) else {
            events = SampleData.seedEvents
            return
        }
        events = (try? JSONDecoder().decode([AuraEvent].self, from: data)) ?? []
    }

    private func save() {
        guard let data = try? JSONEncoder().encode(events) else { return }
        try? data.write(to: fileURL, options: .atomic)
    }
}

/// A couple of pre-seeded events so day-one users see a populated timeline
/// instead of a dead empty screen the very first time they open the app.
enum SampleData {
    static let seedEvents: [AuraEvent] = [
        AuraEvent(title: "Downloaded Auranomics", emoji: "👑", points: 1000, category: .confidence, date: Date())
    ]
}
