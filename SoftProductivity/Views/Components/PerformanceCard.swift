import SwiftUI
import Charts

struct PerformanceCard: View {
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            VStack(alignment: .leading, spacing: 12) {
                Text("See your\nperformance")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(SoftTheme.textPrimary)
                    .lineLimit(2)
                
                Button {
                    // Check now action
                } label: {
                    Text("Check now")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            Capsule()
                                .fill(SoftTheme.plusButton)
                        )
                }
            }
            
            Spacer()
            
            // Mini chart + badge
            ZStack(alignment: .topTrailing) {
                // Simple bar chart representation
                MiniBarChart()
                    .frame(width: 110, height: 60)
                
                // Green badge
                HStack(spacing: 2) {
                    Image(systemName: "triangle.fill")
                        .font(.system(size: 8))
                        .rotationEffect(.degrees(0))
                    Text("+3.45%")
                        .font(.system(size: 11, weight: .bold))
                }
                .foregroundStyle(.white)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(
                    Capsule()
                        .fill(SoftTheme.green)
                )
                .offset(x: 8, y: -10)
            }
        }
        .softCard(cornerRadius: 28, padding: 18)
    }
}

struct MiniBarChart: View {
    // Approximate the pixelated bar chart from the mock
    private let values: [CGFloat] = [0.3, 0.5, 0.4, 0.7, 0.6, 0.9, 0.55, 0.8, 0.65, 0.4, 0.75, 0.5]
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 3) {
            ForEach(0..<values.count, id: \.self) { i in
                RoundedRectangle(cornerRadius: 2)
                    .fill(
                        i % 3 == 0 ? SoftTheme.orange.opacity(0.9) :
                        i % 2 == 0 ? SoftTheme.textPrimary.opacity(0.7) :
                        SoftTheme.textTertiary.opacity(0.4)
                    )
                    .frame(width: 6, height: 50 * values[i])
            }
        }
    }
}

#Preview {
    PerformanceCard()
        .padding()
        .background(SoftTheme.background)
}
