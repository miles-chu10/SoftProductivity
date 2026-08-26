import SwiftUI

enum SoftTheme {
    // Backgrounds
    static let background = Color(red: 0.94, green: 0.93, blue: 0.91) // warm light gray
    static let card = Color.white
    static let cardSecondary = Color(red: 0.97, green: 0.96, blue: 0.95)
    
    // Accents
    static let orange = Color(red: 1.0, green: 0.48, blue: 0.18)
    static let green = Color(red: 0.2, green: 0.78, blue: 0.45)
    static let softOrange = Color(red: 1.0, green: 0.65, blue: 0.4)
    
    // Text
    static let textPrimary = Color(red: 0.15, green: 0.15, blue: 0.18)
    static let textSecondary = Color(red: 0.45, green: 0.45, blue: 0.5)
    static let textTertiary = Color(red: 0.65, green: 0.65, blue: 0.7)
    
    // Shadows for neumorphic feel
    static let shadowLight = Color.white.opacity(0.8)
    static let shadowDark = Color.black.opacity(0.08)
    
    // Nav
    static let navBackground = Color.white.opacity(0.95)
    static let plusButton = Color(red: 0.12, green: 0.12, blue: 0.14)
}

// Soft card modifier
struct SoftCard: ViewModifier {
    var cornerRadius: CGFloat = 24
    var padding: CGFloat = 16
    
    func body(content: Content) -> some View {
        content
            .padding(padding)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(SoftTheme.card)
                    .shadow(color: SoftTheme.shadowDark, radius: 12, x: 0, y: 6)
                    .shadow(color: SoftTheme.shadowLight, radius: 4, x: 0, y: -2)
            )
    }
}

extension View {
    func softCard(cornerRadius: CGFloat = 24, padding: CGFloat = 16) -> some View {
        modifier(SoftCard(cornerRadius: cornerRadius, padding: padding))
    }
}
