import SwiftUI

struct RootTabView: View {
    let repository: AuraRepository
    let paywall: PaywallStore

    var body: some View {
        TabView {
            HomeView(viewModel: HomeViewModel(repository: repository), paywall: paywall)
                .tabItem { Label("Aura", systemImage: "sparkles") }

            NavigationStack {
                HistoryView(viewModel: HistoryViewModel(repository: repository, paywall: paywall))
            }
            .tabItem { Label("History", systemImage: "clock.arrow.circlepath") }

            NavigationStack {
                SettingsView(repository: repository, paywall: paywall)
            }
            .tabItem { Label("Settings", systemImage: "gearshape") }
        }
        .tint(.white)
        .preferredColorScheme(.dark)
    }
}
