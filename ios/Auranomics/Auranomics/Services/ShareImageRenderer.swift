import SwiftUI

/// Renders any SwiftUI view to a UIImage for the share sheet — used to turn
/// AuraShareCardView into a PNG people can post to TikTok/Instagram Stories.
@MainActor
enum ShareImageRenderer {
    static func render<V: View>(_ view: V, size: CGSize) -> UIImage? {
        let renderer = ImageRenderer(content: view.frame(width: size.width, height: size.height))
        renderer.scale = UIScreen.main.scale
        renderer.isOpaque = true
        return renderer.uiImage
    }
}
