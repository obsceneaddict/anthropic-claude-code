import SwiftUI

struct PaywallView: View {
    @State var viewModel: PaywallViewModel
    @Environment(\.dismiss) private var dismiss

    private let features: [(String, String)] = [
        ("♾️", "Unlimited custom aura entries"),
        ("📈", "Full history & trend charts"),
        ("🎨", "Premium share card themes"),
        ("📆", "Weekly Aura Wrapped recap"),
        ("🏷️", "Custom categories")
    ]

    var body: some View {
        ZStack {
            GradientBackground(tint: [Color(hex: "FFD34D"), Color(hex: "FF8A3D")])

            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.white.opacity(0.6))
                            .padding(10)
                            .background(.ultraThinMaterial, in: Circle())
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 12)

                ScrollView {
                    VStack(spacing: 24) {
                        VStack(spacing: 8) {
                            Text("👑").font(.system(size: 48))
                            Text("Auranomics Pro")
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)
                            Text("Track every drop of aura. No limits.")
                                .font(.system(size: 14))
                                .foregroundStyle(.white.opacity(0.6))
                        }
                        .padding(.top, 12)

                        VStack(alignment: .leading, spacing: 14) {
                            ForEach(features, id: \.1) { feature in
                                HStack(spacing: 12) {
                                    Text(feature.0).font(.system(size: 18))
                                    Text(feature.1)
                                        .font(.system(size: 14, weight: .medium, design: .rounded))
                                        .foregroundStyle(.white.opacity(0.85))
                                    Spacer()
                                }
                            }
                        }
                        .padding(18)
                        .glassCard()

                        VStack(spacing: 10) {
                            ForEach(viewModel.plans) { plan in
                                planRow(plan)
                            }
                        }

                        Button {
                            Task { await viewModel.confirmPurchase() }
                        } label: {
                            if viewModel.isPurchasing {
                                ProgressView().tint(.white)
                            } else {
                                Text("Unlock Auranomics Pro")
                            }
                        }
                        .buttonStyle(PrimaryButtonStyle(gradient: [Color(hex: "FFD34D"), Color(hex: "FF8A3D")]))
                        .disabled(viewModel.isPurchasing)

                        Button("Restore purchases") {
                            Task { await viewModel.restore() }
                        }
                        .font(.system(size: 13))
                        .foregroundStyle(.white.opacity(0.5))

                        HStack(spacing: 16) {
                            Link("Terms", destination: Constants.Links.termsOfUse)
                            Link("Privacy", destination: Constants.Links.privacyPolicy)
                        }
                        .font(.system(size: 12))
                        .foregroundStyle(.white.opacity(0.4))
                        .padding(.bottom, 20)
                    }
                    .padding(.horizontal, 24)
                }
            }
        }
        .onChange(of: viewModel.store.isPro) { _, isPro in
            if isPro { dismiss() }
        }
        .preferredColorScheme(.dark)
    }

    private func planRow(_ plan: AuraPlan) -> some View {
        Button {
            viewModel.select(plan)
        } label: {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: 6) {
                        Text(plan.title)
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(.white)
                        if let badge = plan.badge {
                            Text(badge)
                                .font(.system(size: 10, weight: .bold))
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(Color(hex: "FFD34D"))
                                .foregroundStyle(.black)
                                .clipShape(Capsule())
                        }
                    }
                    Text(plan.subLabel)
                        .font(.system(size: 12))
                        .foregroundStyle(.white.opacity(0.55))
                }
                Spacer()
                Text(plan.priceLabel)
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
            }
            .padding(16)
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(viewModel.selectedPlan == plan ? Color(hex: "FFD34D") : .clear, lineWidth: 2)
            )
            .glassCard(cornerRadius: 18)
        }
        .buttonStyle(.plain)
    }
}
