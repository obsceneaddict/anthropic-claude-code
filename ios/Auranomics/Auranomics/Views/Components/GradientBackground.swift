import SwiftUI

/// Signature "dark luxury" backdrop used on every screen: deep near-black base
/// with a slow-drifting aura-colored glow, so the whole app reads as one
/// cinematic surface instead of a stack of screens.
struct GradientBackground: View {
    var tint: [Color] = [Color(hex: "A66CFF"), Color(hex: "5AC8FA")]
    @State private var animate = false

    var body: some View {
        ZStack {
            Color(hex: "0A0A0F").ignoresSafeArea()

            RadialGradient(
                colors: [tint[0].opacity(0.35), .clear],
                center: animate ? .topTrailing : .topLeading,
                startRadius: 20,
                endRadius: 420
            )
            .ignoresSafeArea()

            RadialGradient(
                colors: [tint.last!.opacity(0.28), .clear],
                center: animate ? .bottomLeading : .bottomTrailing,
                startRadius: 20,
                endRadius: 460
            )
            .ignoresSafeArea()
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 8).repeatForever(autoreverses: true)) {
                animate = true
            }
        }
    }
}

#Preview {
    GradientBackground()
}
