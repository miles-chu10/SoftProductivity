import SwiftUI

struct TaskCard: View {
    let task: TaskItem
    
    var body: some View {
        HStack(spacing: 14) {
            // Left accent bar
            RoundedRectangle(cornerRadius: 3)
                .fill(task.isComplete ? SoftTheme.green.opacity(0.6) : SoftTheme.orange)
                .frame(width: 4, height: 48)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(task.title)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(SoftTheme.textPrimary)
                    .lineLimit(1)
                
                HStack(spacing: 8) {
                    Text(task.status.rawValue)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(task.isComplete ? SoftTheme.green : SoftTheme.textSecondary)
                    
                    // Avatars
                    HStack(spacing: -8) {
                        ForEach(0..<min(task.avatars.count, 3), id: \.self) { i in
                            Circle()
                                .fill(avatarColor(for: i))
                                .frame(width: 22, height: 22)
                                .overlay(
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 10))
                                        .foregroundStyle(.white.opacity(0.9))
                                )
                                .overlay(
                                    Circle().stroke(SoftTheme.card, lineWidth: 1.5)
                                )
                        }
                    }
                }
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 8) {
                Button {
                    // Menu
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(SoftTheme.textTertiary)
                        .rotationEffect(.degrees(90))
                }
                
                Text(task.time)
                    .font(.system(size: 11))
                    .foregroundStyle(SoftTheme.textTertiary)
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(SoftTheme.card)
                .shadow(color: SoftTheme.shadowDark, radius: 8, x: 0, y: 3)
        )
    }
    
    private func avatarColor(for index: Int) -> Color {
        let colors: [Color] = [.orange, .blue, .purple, .teal, .pink]
        return colors[index % colors.count]
    }
}

#Preview {
    VStack {
        ForEach(TaskItem.samples) { task in
            TaskCard(task: task)
        }
    }
    .padding()
    .background(SoftTheme.background)
}
