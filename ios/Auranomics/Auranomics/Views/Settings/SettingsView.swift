import SwiftUI

struct SettingsView: View {
    let repository: AuraRepository
    @State var paywall: PaywallStore
    @State private var showPaywall = false
    @State private var showDeleteConfirm = false
    @AppStorage("auranomics.hapticsEnabled") private var hapticsEnabled = true

    var body: some View {
        ZStack {
            GradientBackground()

            ScrollView {
                VStack(spacing: 20) {
                    VStack(spacing: 4) {
                        Text(paywall.isPro ? "👑 Auranomics Pro" : "Free plan")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                        if !paywall.isPro {
                            Button("Upgrade to Pro") { showPaywall = true }
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundStyle(Color(hex: "FFD34D"))
                        }
                    }
                    .padding(.top, 12)

                    VStack(spacing: 0) {
                        Toggle("Haptics", isOn: $hapticsEnabled)
                            .padding(16)
                        Divider().background(.white.opacity(0.1))
                        NavigationLink(destination: WebLinkView(url: Constants.Links.privacyPolicy, title: "Privacy Policy")) {
                            settingsRow("Privacy Policy")
                        }
                        Divider().background(.white.opacity(0.1))
                        NavigationLink(destination: WebLinkView(url: Constants.Links.termsOfUse, title: "Terms of Use")) {
                            settingsRow("Terms of Use")
                        }
                        Divider().background(.white.opacity(0.1))
                        NavigationLink(destination: WebLinkView(url: Constants.Links.support, title: "Support")) {
                            settingsRow("Contact Support")
                        }
                    }
                    .glassCard()
                    .tint(.white)

                    Button(role: .destructive) {
                        showDeleteConfirm = true
                    } label: {
                        Text("Delete all my data")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(Color(hex: "FF6C6C"))
                    }
                    .padding(.top, 8)

                    Text("Auranomics v1.0.0")
                        .font(.system(size: 12))
                        .foregroundStyle(.white.opacity(0.3))
                        .padding(.top, 20)
                }
                .padding(20)
            }
        }
        .navigationTitle("Settings")
        .sheet(isPresented: $showPaywall) {
            PaywallView(viewModel: PaywallViewModel(store: paywall, trigger: "settings"))
        }
        .alert("Delete all aura data?", isPresented: $showDeleteConfirm) {
            Button("Delete", role: .destructive) { repository.deleteAll() }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("This clears every logged event on this device. This can't be undone.")
        }
        .preferredColorScheme(.dark)
    }

    private func settingsRow(_ title: String) -> some View {
        HStack {
            Text(title).foregroundStyle(.white).font(.system(size: 15))
            Spacer()
            Image(systemName: "chevron.right").foregroundStyle(.white.opacity(0.3)).font(.system(size: 12))
        }
        .padding(16)
    }
}

struct WebLinkView: View {
    let url: URL
    let title: String

    var body: some View {
        ZStack {
            GradientBackground()
            VStack(spacing: 16) {
                Text(title).font(.system(size: 20, weight: .bold, design: .rounded)).foregroundStyle(.white)
                Text("DO WERYFIKACJI: publish the real \(title.lowercased()) at \(url.absoluteString) before App Store submission.")
                    .font(.system(size: 13))
                    .foregroundStyle(.white.opacity(0.6))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
            }
        }
        .preferredColorScheme(.dark)
    }
}
