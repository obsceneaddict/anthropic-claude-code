import SwiftUI

/// Big animated numeric readout used for scores — content transitions give the
/// "counting up/down" feel without a custom timer.
struct AuraCountText: View {
    let value: Int
    var font: Font = .system(size: 56, weight: .bold, design: .rounded)
    var color: Color = .white

    var body: some View {
        Text(value.formatted())
            .font(font)
            .foregroundStyle(color)
            .contentTransition(.numericText(value: Double(value)))
            .animation(.spring(response: 0.6, dampingFraction: 0.8), value: value)
            .monospacedDigit()
    }
}
