import SwiftUI
import Charts

struct ProjectCard: View {
    let project: Project
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if project.chartType == .lineBar {
                // Chart with bars and line
                ZStack {
                    // Background bars
                    HStack(alignment: .bottom, spacing: 8) {
                        ForEach(0..<3, id: \.self) { i in
                            RoundedRectangle(cornerRadius: 6)
                                .fill(SoftTheme.textTertiary.opacity(0.15))
                                .frame(width: 28, height: [40, 70, 55][i])
                        }
                    }
                    
                    // Orange line
                    Chart {
                        ForEach(Array([0.4, 0.55, 0.35, 0.7, 0.6, 0.75].enumerated()), id: \.offset) { idx, val in
                            LineMark(
                                x: .value("x", idx),
                                y: .value("y", val)
                            )
                            .foregroundStyle(SoftTheme.orange)
                            .lineStyle(StrokeStyle(lineWidth: 2.5, lineCap: .round))
                            .interpolationMethod(.catmullRom)
                            
                            PointMark(
                                x: .value("x", idx),
                                y: .value("y", val)
                            )
                            .foregroundStyle(SoftTheme.orange)
                            .symbolSize(30)
                        }
                    }
                    .chartXAxis(.hidden)
                    .chartYAxis(.hidden)
                    .frame(height: 70)
                    
                    // Percentage labels
                    if let pcts = project.percentages {
                        HStack {
                            Text("\(pcts[0])%")
                                .font(.system(size: 11, weight: .medium))
                                .foregroundStyle(SoftTheme.textSecondary)
                            Spacer()
                            Text("\(pcts[1])%")
                                .font(.system(size: 13, weight: .bold))
                                .foregroundStyle(SoftTheme.textPrimary)
                            Spacer()
                            Text("\(pcts[2])%")
                                .font(.system(size: 11, weight: .medium))
                                .foregroundStyle(SoftTheme.textSecondary)
                        }
                        .offset(y: -28)
                    }
                }
                .frame(height: 80)
            } else {
                // Icons style
                HStack(spacing: 12) {
                    if let icons = project.icons {
                        ForEach(icons, id: \.self) { icon in
                            Image(systemName: icon)
                                .font(.system(size: 22))
                                .foregroundStyle(icon.contains("leaf") ? SoftTheme.green : SoftTheme.orange)
                                .frame(width: 48, height: 48)
                                .background(
                                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                                        .fill(SoftTheme.cardSecondary)
                                )
                        }
                    }
                    Spacer()
                }
                .padding(.top, 4)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(project.title)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(SoftTheme.textPrimary)
                
                Text(project.subtitle)
                    .font(.system(size: 12))
                    .foregroundStyle(SoftTheme.textSecondary)
                    .lineLimit(2)
            }
            
            // Progress bar
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(SoftTheme.textTertiary.opacity(0.2))
                        .frame(height: 6)
                    
                    Capsule()
                        .fill(SoftTheme.textPrimary)
                        .frame(width: geo.size.width * project.progress, height: 6)
                }
            }
            .frame(height: 6)
            
            HStack {
                Spacer()
                Text("\(Int(project.progress * 100))%")
                    .font(.system(size: 11, weight: .medium))
                    .foregroundStyle(SoftTheme.textTertiary)
            }
        }
        .softCard(cornerRadius: 22, padding: 14)
    }
}

#Preview {
    HStack {
        ProjectCard(project: Project.samples[0])
        ProjectCard(project: Project.samples[1])
    }
    .padding()
    .background(SoftTheme.background)
}
