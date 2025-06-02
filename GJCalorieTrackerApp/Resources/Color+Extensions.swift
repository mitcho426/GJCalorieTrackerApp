import SwiftUI

extension Color {
    static let premiumIndigo = Color(hex: "#5856D6")
    static let premiumMint = Color(hex: "#00D4AA")
    static let premiumOrange = Color(hex: "#FF9500")

    // Using system/semantic colors for these as they adapt to light/dark mode
    static let premiumSurface = Color(.systemBackground) // More adaptable than clear
    static let premiumTextPrimary = Color.primary
    static let premiumTextSecondary = Color.secondary

    // Standard system colors, can be replaced with specific hex if needed
    static let premiumSuccess = Color.green
    static let premiumWarning = Color.orange // Note: This is distinct from premiumOrange
    static let premiumError = Color.red

    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0) // Default to black if malformed
            print("Debug: Invalid hex color string: \(hex). Defaulting to black.")
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
