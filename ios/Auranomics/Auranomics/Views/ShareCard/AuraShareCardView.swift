import SwiftUI

/// The actual pixels that get exported to the share sheet. Designed for
/// Instagram Story / TikTok photo mode (9:16), branded so every share is
/// also an ad for the app — this is the core viral loop.
struct AuraShareCardView: View {
    let event: AuraEvent
    let totalScore: Int
    let tier: AuraTier

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(hex: "0A0A0F"), tier.gradient.first!.opacity(0.35), Color(hex: "0A0A0F")], startPoint: .top, endPoint: .bottom)

            RadialGradient(colors: [tier.gradient.last!.opacity(0.4), .clear], center: .bottomTrailing, startRadius: 10, endRadius: 500)

            VStack(spacing: 28) {
                Spacer()

                Text("AURANOMICS")
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .tracking(6)
                    .foregroundStyle(.white.opacity(0.6))

                Text(tier.emoji).font(.system(size: 56))

                VStack(spacing: 10) {
                    Text(event.emoji).font(.system(size: 36))
                    Text(event.title)
                        .font(.system(size: 20, weight: .medium, design: .rounded))
                        .foregroundStyle(.white.opacity(0.85))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                    Text(event.formattedPoints)
                        .font(.system(size: 64, weight: .heavy, design: .rounded))
                        .foregroundStyle(event.isGain ? Color(hex: "6CFFB0") : Color(hex: "FF6C6C"))
                }

                Spacer()

                VStack(spacing: 4) {
                    Text("TOTAL AURA")
                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                        .tracking(3)
                        .foregroundStyle(.white.opacity(0.5))
                    Text(totalScore.formatted())
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                    Text("\(tier.label.uppercased()) TIER")
                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                        .tracking(2)
                        .foregroundStyle(.white.opacity(0.5))
                }

                Text("rate your aura → Auranomics")
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundStyle(.white.opacity(0.4))
                    .padding(.bottom, 40)
            }
            .padding(.top, 60)
        }
        .frame(width: 1080, height: 1920)
    }
}

struct ShareCardSheet: View {
    let event: AuraEvent
    let totalScore: Int
    let tier: AuraTier

    @Environment(\.dismiss) private var dismiss
    @State private var renderedImage: UIImage?
    @State private var showShareSheet = false

    var body: some View {
        NavigationStack {
            ZStack {
                GradientBackground()
                VStack(spacing: 20) {
                    AuraShareCardView(event: event, totalScore: totalScore, tier: tier)
                        .frame(width: 1080, height: 1920)
                        .scaleEffect(0.28)
                        .frame(width: 300, height: 538)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 20)

                    Button("Share to Story / Feed") {
                        renderedImage = ShareImageRenderer.render(
                            AuraShareCardView(event: event, totalScore: totalScore, tier: tier),
                            size: CGSize(width: 1080, height: 1920)
                        )
                        Analytics.shared.log(.shareCardExported)
                        showShareSheet = true
                    }
                    .buttonStyle(PrimaryButtonStyle(gradient: tier.gradient))
                    .padding(.horizontal, 32)
                }
                .padding(.top, 40)
            }
            .navigationTitle("Your Aura Card")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") { dismiss() }.foregroundStyle(.white.opacity(0.7))
                }
            }
        }
        .preferredColorScheme(.dark)
        .sheet(isPresented: $showShareSheet) {
            if let renderedImage {
                ActivityShareSheet(items: [renderedImage])
            }
        }
    }
}

import UIKit

struct ActivityShareSheet: UIViewControllerRepresentable {
    let items: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: items, applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
