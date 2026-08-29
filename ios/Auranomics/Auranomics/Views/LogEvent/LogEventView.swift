import SwiftUI

struct LogEventView: View {
    @State var viewModel: LogEventViewModel
    let onLogged: (AuraEvent) -> Void
    let onPaywall: () -> Void

    @Environment(\.dismiss) private var dismiss
    @State private var mode: Mode = .presets

    private enum Mode: String, CaseIterable { case presets = "Quick log", custom = "Type it" }

    var body: some View {
        NavigationStack {
            ZStack {
                GradientBackground()

                ScrollView {
                    VStack(spacing: 20) {
                        Picker("Mode", selection: $mode) {
                            ForEach(Mode.allCases, id: \.self) { Text($0.rawValue).tag($0) }
                        }
                        .pickerStyle(.segmented)

                        switch mode {
                        case .presets:
                            QuickEventGridView(presets: viewModel.presets) { preset in
                                onLogged(viewModel.makeEvent(from: preset))
                                dismiss()
                            }
                        case .custom:
                            CustomEventInputView(viewModel: viewModel) { event in
                                onLogged(event)
                                dismiss()
                            }
                        }
                    }
                    .padding(20)
                }
            }
            .navigationTitle("Log your aura")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") { dismiss() }
                        .foregroundStyle(.white.opacity(0.7))
                }
            }
            .toolbarBackground(.hidden, for: .navigationBar)
            .onChange(of: viewModel.didHitPaywall) { _, hit in
                if hit {
                    dismiss()
                    onPaywall()
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}
