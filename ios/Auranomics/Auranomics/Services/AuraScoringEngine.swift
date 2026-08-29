import Foundation

/// Rule-based scorer for custom (free-text) aura entries.
/// No network call, no AI API required for MVP — fully on-device and deterministic
/// (same text always yields the same score, so it *feels* intentional rather than random).
/// See docs/STRATEGY.md Część 8 for the optional AI-powered variant (Phase 2).
enum AuraScoringEngine {

    private static let positiveWords: [String: Int] = [
        "won": 2200, "win": 2200, "crush": 2400, "confident": 2000, "confidence": 2000,
        "proud": 1800, "nailed": 2100, "slay": 2600, "glow": 1700, "glowing": 1700,
        "love": 1900, "kissed": 2300, "flirt": 1600, "laugh": 1500, "laughed": 1500,
        "money": 1400, "promotion": 2800, "gym": 1200, "ran": 1000, "smile": 900,
        "compliment": 1600, "yes": 700, "success": 2000
    ]

    private static let negativeWords: [String: Int] = [
        "embarrass": -1800, "embarrassing": -1800, "cringe": -2000, "fail": -1600,
        "failed": -1600, "awkward": -1300, "tripped": -1200, "spilled": -1000,
        "rejected": -2200, "ghosted": -1900, "late": -700, "forgot": -600,
        "lost": -1100, "cry": -900, "cried": -900, "sorry": -500, "stupid": -1500,
        "ignored": -1300, "no": -400
    ]

    /// Deterministic pseudo-random magnitude derived from the text itself,
    /// so re-scoring the same entry always returns the same "vibe".
    private static func seededMagnitude(from text: String, range: ClosedRange<Int>) -> Int {
        var hasher = Hasher()
        hasher.combine(text.lowercased())
        let hash = abs(hasher.finalize())
        let span = range.upperBound - range.lowerBound
        return range.lowerBound + (span == 0 ? 0 : hash % (span + 1))
    }

    static func score(for rawText: String) -> (points: Int, category: AuraCategory) {
        let text = rawText.lowercased()
        guard !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return (0, .chaos)
        }

        var runningTotal = 0
        var matchedPositive = false
        var matchedNegative = false

        for (word, value) in positiveWords where text.contains(word) {
            runningTotal += value
            matchedPositive = true
        }
        for (word, value) in negativeWords where text.contains(word) {
            runningTotal += value
            matchedNegative = true
        }

        // Punctuation / emphasis multiplier — more "!" or emoji-like energy, bigger swing.
        let exclamations = text.filter { $0 == "!" }.count
        let emphasisMultiplier = 1.0 + min(Double(exclamations) * 0.15, 0.6)

        let category: AuraCategory
        if matchedPositive && !matchedNegative {
            category = text.contains("love") || text.contains("kiss") || text.contains("flirt") ? .love : .confidence
        } else if matchedNegative && !matchedPositive {
            category = .fails
        } else if matchedPositive && matchedNegative {
            category = .chaos
        } else {
            // No keyword match at all — fall back to a deterministic "vibe roll".
            let magnitude = seededMagnitude(from: text, range: -1500...2200)
            return (magnitude, .chaos)
        }

        let finalPoints = Int(Double(runningTotal) * emphasisMultiplier)
        // Clamp to keep single entries from feeling absurd.
        return (max(-3000, min(3000, finalPoints)), category)
    }
}
