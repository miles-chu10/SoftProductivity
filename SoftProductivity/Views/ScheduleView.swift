import SwiftUI

struct ScheduleView: View {
    var onDismiss: (() -> Void)? = nil
    @State private var selectedDay = 20
    private let weekDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    private let dates = [17, 18, 19, 20, 21, 22, 23]
    
    // Hours from 9AM to 8PM
    private let hours = Array(9...20)
    
    var body: some View {
        VStack(spacing: 0) {
            // Nav header
            HStack {
                Button {
                    onDismiss?()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(SoftTheme.textPrimary)
                        .frame(width: 36, height: 36)
                        .background(
                            Circle()
                                .fill(SoftTheme.card)
                                .shadow(color: SoftTheme.shadowDark, radius: 4, x: 0, y: 2)
                        )
                }
                
                Spacer()
                
                Text("Schedule")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(SoftTheme.textPrimary)
                
                Spacer()
                
                Button {} label: {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(SoftTheme.textPrimary)
                        .frame(width: 36, height: 36)
                        .background(
                            Circle()
                                .fill(SoftTheme.card)
                                .shadow(color: SoftTheme.shadowDark, radius: 4, x: 0, y: 2)
                        )
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 8)
            .padding(.bottom, 16)
            
            // Month
            HStack {
                Text("November 2026")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(SoftTheme.textPrimary)
                
                Image(systemName: "chevron.down")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(SoftTheme.textSecondary)
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 16)
            
            // Week selector
            HStack(spacing: 0) {
                ForEach(0..<7, id: \.self) { i in
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            selectedDay = dates[i]
                        }
                    } label: {
                        VStack(spacing: 6) {
                            Text(weekDays[i])
                                .font(.system(size: 12, weight: .medium))
                                .foregroundStyle(SoftTheme.textTertiary)
                            
                            Text("\(dates[i])")
                                .font(.system(size: 16, weight: selectedDay == dates[i] ? .bold : .medium))
                                .foregroundStyle(selectedDay == dates[i] ? SoftTheme.textPrimary : SoftTheme.textSecondary)
                                .frame(width: 36, height: 36)
                                .background(
                                    Circle()
                                        .fill(selectedDay == dates[i] ? SoftTheme.card : Color.clear)
                                        .shadow(color: selectedDay == dates[i] ? SoftTheme.shadowDark : .clear, radius: 6, x: 0, y: 2)
                                )
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 20)
            
            // Timeline
            ScrollView(showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    // Time labels
                    VStack(alignment: .trailing, spacing: 0) {
                        ForEach(hours, id: \.self) { hour in
                            Text(hourLabel(hour))
                                .font(.system(size: 11, weight: .medium))
                                .foregroundStyle(SoftTheme.textTertiary)
                                .frame(height: 72, alignment: .top)
                        }
                    }
                    .frame(width: 48)
                    .padding(.trailing, 8)
                    
                    // Events column
                    ZStack(alignment: .topLeading) {
                        // Subtle grid lines
                        VStack(spacing: 0) {
                            ForEach(hours, id: \.self) { _ in
                                Rectangle()
                                    .fill(SoftTheme.textTertiary.opacity(0.08))
                                    .frame(height: 1)
                                    .frame(maxWidth: .infinity)
                                    .padding(.bottom, 71)
                            }
                        }
                        
                        // Events
                        VStack(alignment: .leading, spacing: 12) {
                            ForEach(ScheduleEvent.samples) { event in
                                EventCard(event: event)
                            }
                        }
                        .padding(.top, 4)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 120)
            }
        }
    }
    
    private func hourLabel(_ hour: Int) -> String {
        if hour == 12 { return "12 PM" }
        if hour > 12 { return "\(hour - 12) PM" }
        return "\(hour) AM"
    }
}

#Preview {
    ScheduleView(onDismiss: {})
        .background(SoftTheme.background)
}
