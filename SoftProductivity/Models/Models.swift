import Foundation
import SwiftUI

// MARK: - Project
struct Project: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let progress: Double          // 0...1
    let chartType: ChartType
    let icons: [String]?          // SF Symbols or asset names
    let percentages: [Int]?       // e.g. [30, 12, 32]
    
    enum ChartType {
        case lineBar
        case icons
    }
}

// MARK: - Task
struct TaskItem: Identifiable {
    let id = UUID()
    let title: String
    let status: TaskStatus
    let time: String
    let avatars: [String]         // asset names or initials
    let isComplete: Bool
    
    enum TaskStatus: String {
        case upcoming = "Upcoming"
        case complete = "Complete"
        case inProgress = "In Progress"
    }
}

// MARK: - Schedule Event
struct ScheduleEvent: Identifiable {
    let id = UUID()
    let title: String
    let status: EventStatus
    let startTime: String
    let endTime: String
    let hour: Int                 // for positioning 9-20
    let durationHours: Double
    let avatars: [Color]
    let description: String?
    let accentColor: Color
    
    enum EventStatus: String {
        case inProgress = "In Progress"
        case upcoming = "Upcoming"
        case complete = "Complete"
    }
}

// MARK: - Sample Data
extension Project {
    static let samples: [Project] = [
        Project(
            title: "Decision making",
            subtitle: "Analysing drop-off rates and metrics.",
            progress: 0.08,
            chartType: .lineBar,
            icons: nil,
            percentages: [30, 12, 32]
        ),
        Project(
            title: "Decision making",
            subtitle: "Wing peppers parm Bianca green.",
            progress: 0.45,
            chartType: .icons,
            icons: ["leaf.fill", "apple.logo"],
            percentages: nil
        )
    ]
}

extension TaskItem {
    static let samples: [TaskItem] = [
        TaskItem(
            title: "Website design development",
            status: .upcoming,
            time: "Today: 10:15am",
            avatars: ["person1", "person2", "person3"],
            isComplete: false
        ),
        TaskItem(
            title: "Client reviews and feedback",
            status: .complete,
            time: "Today: 09:00am",
            avatars: ["person1", "person2"],
            isComplete: true
        )
    ]
}

extension ScheduleEvent {
    static let samples: [ScheduleEvent] = [
        ScheduleEvent(
            title: "Wireframing and brainstorming",
            status: .inProgress,
            startTime: "9:15 AM",
            endTime: "10:15 AM",
            hour: 9,
            durationHours: 1.0,
            avatars: [.orange, .blue, .purple],
            description: nil,
            accentColor: Color(red: 1.0, green: 0.55, blue: 0.2)
        ),
        ScheduleEvent(
            title: "Design system planning",
            status: .upcoming,
            startTime: "11:15 AM",
            endTime: "01:00 PM",
            hour: 11,
            durationHours: 1.75,
            avatars: [.teal, .pink, .indigo],
            description: nil,
            accentColor: Color(red: 0.3, green: 0.7, blue: 0.9)
        ),
        ScheduleEvent(
            title: "Exploration phase",
            status: .upcoming,
            startTime: "02:00 PM",
            endTime: "06:00 PM",
            hour: 14,
            durationHours: 4.0,
            avatars: [.green, .orange, .cyan],
            description: nil,
            accentColor: Color(red: 0.4, green: 0.8, blue: 0.5)
        ),
        ScheduleEvent(
            title: "Review of updated high-fidelity mocks",
            status: .upcoming,
            startTime: "02:00 PM",
            endTime: "06:00 PM",
            hour: 16,
            durationHours: 2.0,
            avatars: [],
            description: "Key points simplify login flow, adjust sidebar navigation. Approval pending for final colors.",
            accentColor: Color(red: 0.95, green: 0.6, blue: 0.3)
        ),
        ScheduleEvent(
            title: "Design style finalization",
            status: .upcoming,
            startTime: "07:00 AM",
            endTime: "08:20 PM",
            hour: 19,
            durationHours: 1.0,
            avatars: [.mint, .brown, .yellow],
            description: nil,
            accentColor: Color(red: 0.6, green: 0.5, blue: 0.9)
        )
    ]
}
