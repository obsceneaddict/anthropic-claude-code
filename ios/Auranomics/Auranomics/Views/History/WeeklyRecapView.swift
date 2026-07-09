import SwiftUI

struct WeeklyRecapView: View {
    let weekScore: Int
    let breakdown: [(category: AuraCategory, total: Int)]
    let biggestGain: AuraEvent?
    let biggestLoss: AuraEvent?

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack {
                Text("THIS WEEK")
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .tracking(2)
                    .foregroundStyle(.white.opacity(0.5))
                Spacer()
                Text(weekScore >= 0 ? "+\(weekScore.formatted())" : weekScore.formatted())
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundStyle(weekScore >= 0 ? Color(hex: "6CFFB0") : Color(hex: "FF6C6C"))
            }

            VStack(spacing: 8) {
                ForEach(breakdown, id: \.category) { item in
                    HStack {
                        Text(item.category.emoji)
                        Text(item.category.label)
                            .font(.system(size: 13))
                            .foregroundStyle(.white.opacity(0.7))
                        Spacer()
                        Text(item.total >= 0 ? "+\(item.total)" : "\(item.total)")
                            .font(.system(size: 13, weight: .semibold, design: .rounded))
                            .foregroundStyle(item.total >= 0 ? Color(hex: "6CFFB0") : Color(hex: "FF6C6C"))
                    }
                }
            }

            if let gain = biggestGain {
                recapRow(label: "Biggest flex", event: gain)
            }
            if let loss = biggestLoss {
                recapRow(label: "Biggest L", event: loss)
            }
        }
        .padding(18)
        .glassCard()
    }

    private func recapRow(label: String, event: AuraEvent) -> some View {
        HStack {
            Text(label)
                .font(.system(size: 12))
                .foregroundStyle(.white.opacity(0.5))
            Spacer()
            Text("\(event.emoji) \(event.title)")
                .font(.system(size: 12, weight: .medium))
                .foregroundStyle(.white.opacity(0.8))
                .lineLimit(1)
        }
    }
}
