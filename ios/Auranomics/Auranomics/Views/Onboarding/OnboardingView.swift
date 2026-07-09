import SwiftUI

struct OnboardingView: View {
    @AppStorage("auranomics.hasOnboarded") private var hasOnboarded = false
    @State private var page = 0

    private let pages: [(emoji: String, title: String, subtitle: String)] = [
        ("👑", "Every move you make\nchanges your aura.", "Confidence, cringe, chaos, love — it's all points. Start tracking the number that actually matters."),
        ("✨", "Log it in one tap.", "Pick a moment or type your own. Auranomics scores it instantly — no journaling, no effort."),
        ("📤", "Flex it. Or hide it.", "Every day builds a shareable Aura Card. Post your glow-ups. Bury your L's. Your call.")
    ]

    var body: some View {
        ZStack {
            GradientBackground()

            VStack {
                TabView(selection: $page) {
                    ForEach(pages.indices, id: \.self) { index in
                        OnboardingPage(page: pages[index])
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))

                Button(page == pages.count - 1 ? "Start tracking my aura" : "Continue") {
                    if page == pages.count - 1 {
                        HapticsService.success()
                        Analytics.shared.log(.onboardingCompleted)
                        withAnimation { hasOnboarded = true }
                    } else {
                        withAnimation { page += 1 }
                    }
                }
                .buttonStyle(PrimaryButtonStyle())
                .padding(.horizontal, 28)
                .padding(.bottom, 24)
            }
        }
        .preferredColorScheme(.dark)
    }
}

private struct OnboardingPage: View {
    let page: (emoji: String, title: String, subtitle: String)

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text(page.emoji).font(.system(size: 72))
            Text(page.title)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
            Text(page.subtitle)
                .font(.system(size: 16))
                .multilineTextAlignment(.center)
                .foregroundStyle(.white.opacity(0.6))
                .padding(.horizontal, 32)
            Spacer()
            Spacer()
        }
    }
}

#Preview {
    OnboardingView()
}
