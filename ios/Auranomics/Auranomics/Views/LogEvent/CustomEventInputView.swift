import SwiftUI

struct CustomEventInputView: View {
    @Bindable var viewModel: LogEventViewModel
    let onConfirm: (AuraEvent) -> Void

    @FocusState private var isFocused: Bool

    var body: some View {
        VStack(spacing: 16) {
            TextField("What happened?", text: $viewModel.customText, axis: .vertical)
                .focused($isFocused)
                .font(.system(size: 16, design: .rounded))
                .foregroundStyle(.white)
                .padding(16)
                .glassCard(cornerRadius: 18)
                .lineLimit(3...5)
                .onChange(of: viewModel.customText) { _, _ in
                    viewModel.suggestedPoints = nil
                }

            if !viewModel.canLogMoreCustomToday {
                Text("Free plan: 0 custom entries left today. Auranomics Pro = unlimited.")
                    .font(.system(size: 13))
                    .foregroundStyle(.white.opacity(0.6))
                    .multilineTextAlignment(.center)
            } else {
                Text("\(viewModel.remainingFreeCustomEntries) free custom entries left today")
                    .font(.system(size: 12))
                    .foregroundStyle(.white.opacity(0.45))
            }

            if let points = viewModel.suggestedPoints, let category = viewModel.suggestedCategory {
                HStack(spacing: 10) {
                    Text(category.emoji)
                    Text("Suggested aura:")
                        .font(.system(size: 14))
                        .foregroundStyle(.white.opacity(0.7))
                    Text(points >= 0 ? "+\(points)" : "\(points)")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundStyle(points >= 0 ? Color(hex: "6CFFB0") : Color(hex: "FF6C6C"))
                }
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .glassCard(cornerRadius: 14)
            }

            if viewModel.suggestedPoints == nil {
                Button("Rate my aura") {
                    isFocused = false
                    HapticsService.lightTap()
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                        viewModel.evaluateCustomText()
                    }
                }
                .buttonStyle(PrimaryButtonStyle(isDisabled: viewModel.customText.trimmingCharacters(in: .whitespaces).isEmpty))
                .disabled(viewModel.customText.trimmingCharacters(in: .whitespaces).isEmpty)
            } else {
                Button("Add to my day") {
                    if let event = viewModel.makeCustomEvent() {
                        onConfirm(event)
                    }
                }
                .buttonStyle(PrimaryButtonStyle())
            }
        }
    }
}
