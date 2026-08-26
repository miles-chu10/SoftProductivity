import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var placeholder: String = "Search project, task, event..."
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(SoftTheme.textTertiary)
            
            TextField(placeholder, text: $text)
                .font(.system(size: 15))
                .foregroundStyle(SoftTheme.textPrimary)
            
            Button {
                // Filter action
            } label: {
                Image(systemName: "line.3.horizontal.decrease")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(SoftTheme.textSecondary)
                    .frame(width: 32, height: 32)
                    .background(
                        Circle()
                            .fill(SoftTheme.cardSecondary)
                    )
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(
            Capsule()
                .fill(SoftTheme.card)
                .shadow(color: SoftTheme.shadowDark, radius: 8, x: 0, y: 3)
        )
    }
}
