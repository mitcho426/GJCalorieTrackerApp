import SwiftUI

struct RoundedCardView<Content: View>: View {
    let content: Content
    let padding: CGFloat

    init(@ViewBuilder content: () -> Content, padding: CGFloat = 16) {
        self.content = content()
        self.padding = padding
    }

    var body: some View {
        VStack {
            content
        }
        .padding(padding)
        .background(.ultraThinMaterial)
        .cornerRadius(16)
        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

// Example Usage Preview (Optional, but good for development)
struct RoundedCardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.5)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)

            RoundedCardView {
                VStack {
                    Text("Hello, World!")
                        .font(.headline)
                    Text("This is some content inside the card.")
                        .font(.subheadline)
                }
            }
            .padding() // Add padding around the card for the preview
        }
    }
}
