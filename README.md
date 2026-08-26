# SoftProductivity — iOS App

A beautiful, modern productivity app built with **SwiftUI** that faithfully recreates the soft neumorphic design from the provided iPhone mockups (Welcome / Dashboard + Schedule views).

> Original design reference: two side-by-side iPhone mockups showing a clean productivity UI with performance charts, project cards, today’s tasks, weekly calendar and hourly event timeline.

## Features

- **Home Dashboard**
  - Personalized welcome (“Welcome, Salung”)
  - Soft search bar with filter
  - Performance card with mini bar chart + live **+3.45%** green badge
  - Projects section with two card styles (line+bar chart & icon variants)
  - Today’s tasks list with status, avatar stacks, and time

- **Schedule View** (opened via the calendar icon on Home)
  - Month picker (November 2026)
  - Interactive week-day selector (Thu 20 selected)
  - Hourly timeline (9 AM – 8 PM) with color-coded event cards
  - Status labels (In Progress / Upcoming)
  - Avatar stacks & precise time ranges
  - Detailed review card with multi-line description

- **Custom Floating Bottom Navigation**
  - Home · Analytics · Chat · Profile
  - Prominent floating black “+” button that opens a New Item sheet

- **Soft Neumorphic Design System**
  - Warm light-gray background
  - Soft dual shadows (light + dark) for the neumorphic feel
  - Generous continuous corner radii (18–28 pt)
  - Orange / green accent palette matching the original design
  - Fully light-mode optimized

## How to Run

1. Open **Xcode 15+** (iOS 17+ recommended — uses Swift Charts).
2. Create a new **iOS App** project:
   - Product Name: `SoftProductivity`
   - Interface: **SwiftUI**
   - Language: **Swift**
3. Delete the default `ContentView.swift` and `*App.swift` that Xcode generates.
4. Copy the entire `SoftProductivity/` folder from this repository into your Xcode project (or drag the files into the Project Navigator and check “Copy items if needed”).
5. Ensure every Swift file is added to the app target.
6. Build & run on any iPhone simulator or device.

> **No third-party dependencies.** Uses only SwiftUI + the native Charts framework (iOS 16+).

## Project Structure

```
SoftProductivity/
├── SoftProductivityApp.swift          # @main entry point
├── ContentView.swift                  # Root + tab switching + New Item sheet + placeholders
├── Models/
│   ├── Models.swift                   # Project, TaskItem, ScheduleEvent + sample data
│   └── Theme.swift                    # SoftTheme colors + SoftCard ViewModifier
└── Views/
    ├── HomeView.swift                 # Dashboard
    ├── ScheduleView.swift             # Full-screen schedule with timeline
    └── Components/
        ├── BottomNavBar.swift         # Floating capsule nav + offset +
        ├── SearchBar.swift
        ├── PerformanceCard.swift
        ├── ProjectCard.swift
        ├── TaskCard.swift
        └── EventCard.swift
```

## Customization Tips

- Change the user name “Salung” in `HomeView` and `ProfilePlaceholder`.
- Edit sample data in `Models.swift`.
- All colors live in `Theme.swift` — tweak once and the whole app updates.
- The “+” button already presents a simple create sheet; expand it for real creation flows.
- Want real avatars? Drop images into Assets.xcassets and replace the `person.fill` SF Symbols.

## Design Fidelity

The implementation deliberately mirrors the original mock:

- Same visual hierarchy and card layout
- Matching orange performance chart & green positive indicators
- Event cards with left accent bars, avatar stacks, ellipsis menus
- Floating capsule bottom nav with the large offset black “+”
- Soft continuous corner radii and dual-direction shadows for that soft-UI / neumorphic aesthetic

Clone, open in Xcode, and run. Enjoy!

---

Made with ❤️ by Grok · Design-faithful recreation · August 2026
