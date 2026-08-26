import SwiftUI

struct BottomNavBar: View {
    @Binding var selectedTab: Int
    var onPlusTapped: () -> Void
    
    private let icons = ["house.fill", "chart.pie.fill", "message.fill", "person.fill"]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<4, id: \.self) { index in
                Button {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        selectedTab = index
                    }
                } label: {
                    Image(systemName: icons[index])
                        .font(.system(size: 22, weight: .medium))
                        .foregroundStyle(selectedTab == index ? SoftTheme.textPrimary : SoftTheme.textTertiary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                }
            }
            
            // Spacer for the floating +
            Color.clear.frame(width: 64)
        }
        .padding(.horizontal, 12)
        .padding(.bottom, 8)
        .background(
            Capsule()
                .fill(SoftTheme.navBackground)
                .shadow(color: SoftTheme.shadowDark, radius: 20, x: 0, y: 8)
                .shadow(color: Color.white.opacity(0.6), radius: 4, x: 0, y: -2)
        )
        .overlay(alignment: .trailing) {
            // Floating + button
            Button(action: onPlusTapped) {
                Image(systemName: "plus")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(width: 56, height: 56)
                    .background(
                        Circle()
                            .fill(SoftTheme.plusButton)
                            .shadow(color: SoftTheme.plusButton.opacity(0.4), radius: 12, x: 0, y: 6)
                    )
            }
            .offset(x: -8, y: -18)
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 12)
    }
}

#Preview {
    ZStack {
        SoftTheme.background.ignoresSafeArea()
        VStack {
            Spacer()
            BottomNavBar(selectedTab: .constant(0), onPlusTapped: {})
        }
    }
}
