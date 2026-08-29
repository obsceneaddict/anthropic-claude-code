import SwiftUI

struct TodayTimelineView: View {
    let events: [AuraEvent]

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("TODAY")
                .font(.system(size: 13, weight: .semibold, design: .rounded))
                .tracking(2)
                .foregroundStyle(.white.opacity(0.5))
                .padding(.horizontal, 4)

            if events.isEmpty {
                EmptyStateView(
                    emoji: "🕯️",
                    title: "No aura logged yet today",
                    message: "Tap the + button to log your first moment."
                )
                .glassCard()
            } else {
                VStack(spacing: 10) {
                    ForEach(events) { event in
                        AuraEventRow(event: event)
                    }
                }
            }
        }
    }
}

struct AuraEventRow: View {
    let event: AuraEvent

    var body: some View {
        HStack(spacing: 14) {
            Text(event.emoji)
                .font(.system(size: 22))
                .frame(width: 40, height: 40)
                .background(event.category.tint.opacity(0.18))
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 2) {
                Text(event.title)
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundStyle(.white)
                    .lineLimit(2)
                Text(event.date.formatted(date: .omitted, time: .shortened))
                    .font(.system(size: 12))
                    .foregroundStyle(.white.opacity(0.45))
            }

            Spacer()

            Text(event.formattedPoints)
                .font(.system(size: 15, weight: .bold, design: .rounded))
                .foregroundStyle(event.isGain ? Color(hex: "6CFFB0") : Color(hex: "FF6C6C"))
        }
        .padding(14)
        .glassCard(cornerRadius: 18)
    }
}
