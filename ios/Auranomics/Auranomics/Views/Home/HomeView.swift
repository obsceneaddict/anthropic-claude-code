import SwiftUI

struct HomeView: View {
    @State var viewModel: HomeViewModel
    let paywall: PaywallStore

    var body: some View {
        ZStack {
            GradientBackground(tint: viewModel.tier.gradient)

            ScrollView {
                VStack(spacing: 28) {
                    header

                    AuraRingView(
                        tier: viewModel.tier,
                        progress: viewModel.progressToNextTier,
                        totalScore: viewModel.totalScore
                    )
                    .padding(.top, 8)

                    statsRow

                    TodayTimelineView(events: viewModel.todayEvents)
                }
                .padding(.horizontal, 20)
                .padding(.top, 12)
                .padding(.bottom, 120)
            }

            VStack {
                Spacer()
                logButton
            }
        }
        .sheet(isPresented: $viewModel.showLogSheet) {
            LogEventView(
                viewModel: LogEventViewModel(repository: viewModel.repository, paywall: paywall),
                onLogged: { viewModel.didLog($0) },
                onPaywall: {
                    viewModel.showLogSheet = false
                    viewModel.showPaywall = true
                }
            )
        }
        .fullScreenCover(isPresented: $viewModel.showReveal) {
            if let event = viewModel.lastLoggedEvent {
                AuraRevealView(event: event, newTotal: viewModel.totalScore, tier: viewModel.tier) {
                    viewModel.showReveal = false
                }
            }
        }
        .sheet(isPresented: $viewModel.showPaywall) {
            PaywallView(viewModel: PaywallViewModel(store: paywall, trigger: "home"))
        }
        .preferredColorScheme(.dark)
    }

    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Auranomics")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                Text("\(viewModel.streak) day streak 🔥")
                    .font(.system(size: 13))
                    .foregroundStyle(.white.opacity(0.55))
            }
            Spacer()
        }
    }

    private var statsRow: some View {
        HStack(spacing: 12) {
            statChip(title: "TODAY", value: viewModel.todayScore)
            statChip(title: "TOTAL", value: viewModel.totalScore)
        }
    }

    private func statChip(title: String, value: Int) -> some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.system(size: 11, weight: .semibold, design: .rounded))
                .tracking(1.5)
                .foregroundStyle(.white.opacity(0.5))
            Text(value >= 0 ? "+\(value.formatted())" : value.formatted())
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundStyle(value >= 0 ? Color(hex: "6CFFB0") : Color(hex: "FF6C6C"))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .glassCard(cornerRadius: 18)
    }

    private var logButton: some View {
        Button {
            HapticsService.lightTap()
            viewModel.showLogSheet = true
        } label: {
            Image(systemName: "plus")
                .font(.system(size: 26, weight: .bold))
                .foregroundStyle(.white)
                .frame(width: 64, height: 64)
                .background(
                    LinearGradient(colors: viewModel.tier.gradient, startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .clipShape(Circle())
                .shadow(color: viewModel.tier.gradient.first!.opacity(0.55), radius: 18, y: 8)
        }
        .padding(.bottom, 28)
    }
}

#Preview {
    let repo = AuraRepository()
    return HomeView(viewModel: HomeViewModel(repository: repo), paywall: PaywallStore())
}
