import SwiftUI

/// The "wow moment" screen: full-screen cinematic reveal of the points just
/// earned/lost, with a haptic + color flash tuned to the magnitude of the swing.
struct AuraRevealView: View {
    let event: AuraEvent
    let newTotal: Int
    let tier: AuraTier
    let onDismiss: () -> Void

    @State private var appear = false
    @State private var showShareCard = false

    private var isBigSwing: Bool { abs(event.points) >= 2000 }

    var body: some View {
        ZStack {
            GradientBackground(tint: event.isGain ? [Color(hex: "6CFFB0"), Color(hex: "5AC8FA")] : [Color(hex: "FF6C6C"), Color(hex: "A66CFF")])

            VStack(spacing: 24) {
                Spacer()

                Text(event.emoji)
                    .font(.system(size: 64))
                    .scaleEffect(appear ? 1 : 0.4)
                    .opacity(appear ? 1 : 0)

                Text(event.title)
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .foregroundStyle(.white.opacity(0.75))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)

                Text(event.formattedPoints)
                    .font(.system(size: isBigSwing ? 76 : 60, weight: .heavy, design: .rounded))
                    .foregroundStyle(event.isGain ? Color(hex: "6CFFB0") : Color(hex: "FF6C6C"))
                    .shadow(color: (event.isGain ? Color(hex: "6CFFB0") : Color(hex: "FF6C6C")).opacity(0.6), radius: 24)
                    .scaleEffect(appear ? 1 : 0.6)
                    .opacity(appear ? 1 : 0)

                Text(isBigSwing ? (event.isGain ? "LEGENDARY AURA GAIN" : "CRITICAL AURA HIT") : (event.isGain ? "Aura gained" : "Aura lost"))
                    .font(.system(size: 13, weight: .bold, design: .rounded))
                    .tracking(3)
                    .foregroundStyle(.white.opacity(0.6))

                Spacer()

                VStack(spacing: 6) {
                    Text("New total")
                        .font(.system(size: 12))
                        .foregroundStyle(.white.opacity(0.5))
                    AuraCountText(value: newTotal, font: .system(size: 32, weight: .bold, design: .rounded))
                }
                .padding(.bottom, 8)

                VStack(spacing: 12) {
                    Button("Share my aura") {
                        HapticsService.lightTap()
                        showShareCard = true
                    }
                    .buttonStyle(PrimaryButtonStyle(gradient: tier.gradient))

                    Button("Nice") { onDismiss() }
                        .buttonStyle(SecondaryButtonStyle())
                }
                .padding(.horizontal, 32)
                .padding(.bottom, 24)
            }
        }
        .onAppear {
            if event.isGain { HapticsService.success() } else { HapticsService.warning() }
            withAnimation(.spring(response: 0.55, dampingFraction: 0.65)) { appear = true }
        }
        .sheet(isPresented: $showShareCard) {
            ShareCardSheet(event: event, totalScore: newTotal, tier: tier)
        }
        .preferredColorScheme(.dark)
    }
}
