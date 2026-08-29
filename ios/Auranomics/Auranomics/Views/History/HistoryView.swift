import SwiftUI

struct HistoryView: View {
    @State var viewModel: HistoryViewModel
    @State private var showPaywall = false

    var body: some View {
        ZStack {
            GradientBackground(tint: [Color(hex: "5AC8FA"), Color(hex: "A66CFF")])

            ScrollView {
                VStack(spacing: 20) {
                    WeeklyRecapView(
                        weekScore: viewModel.weekScore,
                        breakdown: viewModel.categoryBreakdown,
                        biggestGain: viewModel.biggestGain,
                        biggestLoss: viewModel.biggestLoss
                    )

                    if viewModel.visibleDays.isEmpty {
                        EmptyStateView(title: "Nothing logged yet", message: "Your history fills in as you log your days.")
                    } else {
                        ForEach(viewModel.visibleDays, id: \.date) { day in
                            VStack(alignment: .leading, spacing: 10) {
                                Text(day.date.formatted(date: .abbreviated, time: .omitted))
                                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                                    .foregroundStyle(.white.opacity(0.5))
                                    .padding(.horizontal, 4)
                                ForEach(day.events) { AuraEventRow(event: $0) }
                            }
                        }
                    }

                    if viewModel.isHistoryLimited {
                        Button {
                            showPaywall = true
                        } label: {
                            VStack(spacing: 6) {
                                Text("🔒 Unlock full history")
                                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                                Text("Free plan only shows the last \(Constants.Limits.freeHistoryDays) days")
                                    .font(.system(size: 12))
                                    .foregroundStyle(.white.opacity(0.6))
                            }
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .glassCard()
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(20)
                .padding(.bottom, 60)
            }
        }
        .sheet(isPresented: $showPaywall) {
            PaywallView(viewModel: PaywallViewModel(store: viewModel.paywall, trigger: "history"))
        }
        .preferredColorScheme(.dark)
        .navigationTitle("History")
    }
}
