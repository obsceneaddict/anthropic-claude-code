import SwiftUI

struct AuraRingView: View {
    let tier: AuraTier
    let progress: Double
    let totalScore: Int
    @State private var animatedProgress: Double = 0

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.white.opacity(0.08), lineWidth: 14)

            Circle()
                .trim(from: 0, to: animatedProgress)
                .stroke(
                    AngularGradient(colors: tier.gradient + [tier.gradient.first!], center: .center),
                    style: StrokeStyle(lineWidth: 14, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .shadow(color: tier.gradient.first!.opacity(0.6), radius: 12)

            VStack(spacing: 6) {
                Text(tier.emoji).font(.system(size: 30))
                AuraCountText(value: totalScore, font: .system(size: 40, weight: .bold, design: .rounded))
                Text(tier.label.uppercased())
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .tracking(2)
                    .foregroundStyle(.white.opacity(0.6))
            }
        }
        .frame(width: 220, height: 220)
        .onAppear {
            withAnimation(.easeOut(duration: 1.1)) { animatedProgress = progress }
        }
        .onChange(of: progress) { _, newValue in
            withAnimation(.easeOut(duration: 0.8)) { animatedProgress = newValue }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        AuraRingView(tier: .glow, progress: 0.4, totalScore: 12500)
    }
}
