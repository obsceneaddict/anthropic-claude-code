import SwiftUI

struct QuickEventGridView: View {
    let presets: [PresetEvent]
    let onSelect: (PresetEvent) -> Void

    private let columns = [GridItem(.adaptive(minimum: 150), spacing: 12)]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(presets) { preset in
                Button {
                    onSelect(preset)
                } label: {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text(preset.emoji).font(.system(size: 22))
                            Spacer()
                            Text(preset.points >= 0 ? "+\(preset.points)" : "\(preset.points)")
                                .font(.system(size: 13, weight: .bold, design: .rounded))
                                .foregroundStyle(preset.points >= 0 ? Color(hex: "6CFFB0") : Color(hex: "FF6C6C"))
                        }
                        Text(preset.title)
                            .font(.system(size: 13, weight: .medium, design: .rounded))
                            .foregroundStyle(.white.opacity(0.85))
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                    }
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .glassCard(cornerRadius: 16)
                }
                .buttonStyle(.plain)
            }
        }
    }
}
