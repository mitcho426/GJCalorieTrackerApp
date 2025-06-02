import SwiftUI

struct MacroProgressBar: View {
    let label: String
    let currentValue: Double
    let goalValue: Double
    let color: Color
    let unit: String

    private var progress: CGFloat {
        if goalValue == 0 {
            return 0 // Avoid division by zero
        }
        return min(CGFloat(currentValue / goalValue), 1.0) // Cap at 100%
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(label)
                    .font(.caption.bold())
                Spacer()
                Text(String(format: "%.1f / %.1f %@", currentValue, goalValue, unit))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: geometry.size.width, height: 8)
                        .foregroundColor(color.opacity(0.2))
                        .cornerRadius(4)

                    Rectangle()
                        .frame(width: geometry.size.width * progress, height: 8)
                        .foregroundColor(color)
                        .cornerRadius(4)
                }
            }
            .frame(height: 8) // Set a fixed height for the GeometryReader containing the bar
        }
    }
}

// Example Usage Preview
struct MacroProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            MacroProgressBar(label: "Protein", currentValue: 70, goalValue: 120, color: .indigo, unit: "g")
            MacroProgressBar(label: "Carbs", currentValue: 180, goalValue: 250, color: .green, unit: "g")
            MacroProgressBar(label: "Fat", currentValue: 50, goalValue: 70, color: .orange, unit: "g")
            MacroProgressBar(label: "Calories", currentValue: 1500, goalValue: 2000, color: .red, unit: "kcal")
            MacroProgressBar(label: "Saturated Fat", currentValue: 25, goalValue: 20, color: .pink, unit: "g") // Example of exceeding goal
            MacroProgressBar(label: "Fiber (Goal 0)", currentValue: 10, goalValue: 0, color: .brown, unit: "g") // Example with goal 0
        }
        .padding()
    }
}
