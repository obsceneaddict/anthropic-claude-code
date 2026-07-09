import SwiftUI

struct EmptyStateView: View {
    var emoji: String = "🌑"
    var title: String
    var message: String

    var body: some View {
        VStack(spacing: 12) {
            Text(emoji).font(.system(size: 44))
            Text(title)
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundStyle(.white)
            Text(message)
                .font(.system(size: 14))
                .foregroundStyle(.white.opacity(0.55))
                .multilineTextAlignment(.center)
        }
        .padding(32)
        .frame(maxWidth: .infinity)
    }
}

struct LoadingView: View {
    var label: String = "Reading your aura…"

    var body: some View {
        VStack(spacing: 14) {
            ProgressView()
                .tint(.white)
            Text(label)
                .font(.system(size: 13, design: .rounded))
                .foregroundStyle(.white.opacity(0.6))
        }
        .padding(24)
    }
}

struct InlineErrorView: View {
    var message: String
    var retry: (() -> Void)?

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundStyle(Color(hex: "FF4D4D"))
            Text(message)
                .font(.system(size: 13))
                .foregroundStyle(.white.opacity(0.7))
                .multilineTextAlignment(.center)
            if let retry {
                Button("Try again", action: retry)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(.white)
            }
        }
        .padding(20)
    }
}
