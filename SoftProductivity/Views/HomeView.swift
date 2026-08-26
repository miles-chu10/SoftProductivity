import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    @State private var showSchedule = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                // Header
                HStack {
                    Text("Welcome, Salung")
                        .font(.system(size: 26, weight: .bold))
                        .foregroundStyle(SoftTheme.textPrimary)
                    
                    Spacer()
                    
                    HStack(spacing: 12) {
                        Button {} label: {
                            Image(systemName: "bell")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundStyle(SoftTheme.textPrimary)
                                .frame(width: 40, height: 40)
                                .background(
                                    Circle()
                                        .fill(SoftTheme.card)
                                        .shadow(color: SoftTheme.shadowDark, radius: 6, x: 0, y: 2)
                                )
                        }
                        
                        Button {
                            showSchedule = true
                        } label: {
                            Image(systemName: "calendar")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundStyle(SoftTheme.textPrimary)
                                .frame(width: 40, height: 40)
                                .background(
                                    Circle()
                                        .fill(SoftTheme.card)
                                        .shadow(color: SoftTheme.shadowDark, radius: 6, x: 0, y: 2)
                                )
                        }
                    }
                }
                .padding(.top, 8)
                
                // Search
                SearchBar(text: $searchText)
                
                // Performance
                PerformanceCard()
                
                // Projects
                VStack(alignment: .leading, spacing: 14) {
                    Text("Projects")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(SoftTheme.textPrimary)
                    
                    HStack(alignment: .top, spacing: 12) {
                        ForEach(Project.samples) { project in
                            ProjectCard(project: project)
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
                
                // Today's tasks
                VStack(alignment: .leading, spacing: 14) {
                    HStack {
                        Text("Today's tasks")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(SoftTheme.textPrimary)
                        
                        Spacer()
                        
                        Button("See all") {}
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(SoftTheme.textSecondary)
                    }
                    
                    VStack(spacing: 12) {
                        ForEach(TaskItem.samples) { task in
                            TaskCard(task: task)
                        }
                    }
                }
                
                // Bottom padding for nav
                Color.clear.frame(height: 100)
            }
            .padding(.horizontal, 20)
        }
        .fullScreenCover(isPresented: $showSchedule) {
            ScheduleView(onDismiss: { showSchedule = false })
        }
    }
}

#Preview {
    HomeView()
        .background(SoftTheme.background)
}
