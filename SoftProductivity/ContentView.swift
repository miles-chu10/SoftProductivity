import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var showNewItem = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            SoftTheme.background
                .ignoresSafeArea()
            
            // Main content
            Group {
                switch selectedTab {
                case 0:
                    HomeView()
                case 1:
                    AnalyticsPlaceholder()
                case 2:
                    ChatPlaceholder()
                case 3:
                    ProfilePlaceholder()
                default:
                    HomeView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // Bottom nav (overlay)
            BottomNavBar(selectedTab: $selectedTab) {
                showNewItem = true
            }
        }
        .sheet(isPresented: $showNewItem) {
            NewItemSheet()
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
    }
}

// MARK: - Placeholders for other tabs
struct AnalyticsPlaceholder: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "chart.pie.fill")
                .font(.system(size: 48))
                .foregroundStyle(SoftTheme.orange.opacity(0.7))
            Text("Analytics")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(SoftTheme.textPrimary)
            Text("Deep insights & reports coming soon")
                .font(.system(size: 15))
                .foregroundStyle(SoftTheme.textSecondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ChatPlaceholder: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "message.fill")
                .font(.system(size: 48))
                .foregroundStyle(SoftTheme.orange.opacity(0.7))
            Text("Team Chat")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(SoftTheme.textPrimary)
            Text("Collaborate with your team in real time")
                .font(.system(size: 15))
                .foregroundStyle(SoftTheme.textSecondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ProfilePlaceholder: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 64))
                .foregroundStyle(SoftTheme.textTertiary)
            Text("Salung")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(SoftTheme.textPrimary)
            Text("Product Designer")
                .font(.system(size: 15))
                .foregroundStyle(SoftTheme.textSecondary)
            
            VStack(spacing: 12) {
                ProfileRow(icon: "gearshape", title: "Settings")
                ProfileRow(icon: "bell.badge", title: "Notifications")
                ProfileRow(icon: "questionmark.circle", title: "Help & Support")
            }
            .padding(.top, 30)
            .padding(.horizontal, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ProfileRow: View {
    let icon: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundStyle(SoftTheme.textSecondary)
                .frame(width: 28)
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(SoftTheme.textPrimary)
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(SoftTheme.textTertiary)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(SoftTheme.card)
                .shadow(color: SoftTheme.shadowDark, radius: 4, x: 0, y: 2)
        )
    }
}

struct NewItemSheet: View {
    @Environment(\.dismiss) private var dismiss
    @State private var title = ""
    @State private var selectedType = 0
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Picker("Type", selection: $selectedType) {
                    Text("Task").tag(0)
                    Text("Event").tag(1)
                    Text("Project").tag(2)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                TextField("Title", text: $title)
                    .font(.system(size: 17))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(SoftTheme.cardSecondary)
                    )
                    .padding(.horizontal)
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Text("Create")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .fill(SoftTheme.plusButton)
                        )
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 20)
            }
            .padding(.top, 20)
            .background(SoftTheme.background.ignoresSafeArea())
            .navigationTitle("New Item")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
