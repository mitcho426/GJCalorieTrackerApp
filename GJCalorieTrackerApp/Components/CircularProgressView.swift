import SwiftUI

struct CircularProgressView: View {
    let progress: Double // Should be 0.0 to 1.0
    let color: Color
    let lineWidth: CGFloat
    let label: String
    let showBackgroundRing: Bool
    let labelFont: Font

    // Default initializer
    init(progress: Double, color: Color, lineWidth: CGFloat = 10.0, label: String = "", showBackgroundRing: Bool = true, labelFont: Font = .caption.weight(.medium)) {
        self.progress = progress
        self.color = color
        self.lineWidth = lineWidth
        self.label = label
        self.showBackgroundRing = showBackgroundRing
        self.labelFont = labelFont
    }

    var body: some View {
        ZStack {
            if showBackgroundRing {
                Circle()
                    .stroke(color.opacity(0.2), lineWidth: lineWidth)
            }

            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0))) // Ensure progress doesn't exceed 1.0
                .stroke(color, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: 270.0)) // Start from the top
                .animation(.spring(duration: 0.7), value: progress) // Animate progress changes

            if !label.isEmpty {
                Text(label)
                    .font(labelFont)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30) {
            CircularProgressView(progress: 0.75, color: .premiumIndigo, lineWidth: 15, label: "75%")
            CircularProgressView(progress: 0.33, color: .premiumMint, lineWidth: 8, label: "1/3", labelFont: .body)
            CircularProgressView(progress: 1.0, color: .premiumOrange, lineWidth: 12, label: "Done!", showBackgroundRing: false, labelFont: .title2)
            CircularProgressView(progress: 0.0, color: .red, lineWidth: 10, label: "0")
            CircularProgressView(progress: 0.5, color: .blue, lineWidth: 20, label: "Calories\n1250/2500", labelFont: .headline)
        }
        .padding()
    }
}
