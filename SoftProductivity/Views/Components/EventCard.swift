import SwiftUI

struct EventCard: View {
    let event: ScheduleEvent
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            // Colored left border
            RoundedRectangle(cornerRadius: 3)
                .fill(event.accentColor)
                .frame(width: 4)
                .padding(.vertical, 4)
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(event.title)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(SoftTheme.textPrimary)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Button {
                        // menu
                    } label: {
                        Image(systemName: "ellipsis")
                            .font(.system(size: 13, weight: .medium))
                            .foregroundStyle(SoftTheme.textTertiary)
                    }
                }
                
                if let desc = event.description {
                    Text(desc)
                        .font(.system(size: 13))
                        .foregroundStyle(SoftTheme.textSecondary)
                        .lineLimit(4)
                        .fixedSize(horizontal: false, vertical: true)
                } else {
                    Text(event.status.rawValue)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(event.status == .inProgress ? SoftTheme.orange : SoftTheme.textSecondary)
                }
                
                HStack {
                    // Avatars
                    if !event.avatars.isEmpty {
                        HStack(spacing: -8) {
                            ForEach(0..<min(event.avatars.count, 3), id: \.self) { i in
                                Circle()
                                    .fill(event.avatars[i])
                                    .frame(width: 24, height: 24)
                                    .overlay(
                                        Image(systemName: "person.fill")
                                            .font(.system(size: 11))
                                            .foregroundStyle(.white.opacity(0.85))
                                    )
                                    .overlay(
                                        Circle().stroke(SoftTheme.card, lineWidth: 1.5)
                                    )
                            }
                        }
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 4) {
                        Image(systemName: "clock")
                            .font(.system(size: 11))
                        Text("\(event.startTime) - \(event.endTime)")
                            .font(.system(size: 11, weight: .medium))
                    }
                    .foregroundStyle(SoftTheme.textTertiary)
                }
            }
            .padding(.leading, 12)
            .padding(.vertical, 12)
            .padding(.trailing, 14)
        }
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(SoftTheme.card)
                .shadow(color: SoftTheme.shadowDark, radius: 8, x: 0, y: 4)
        )
    }
}

#Preview {
    VStack(spacing: 12) {
        ForEach(ScheduleEvent.samples.prefix(3)) { event in
            EventCard(event: event)
        }
    }
    .padding()
    .background(SoftTheme.background)
}
