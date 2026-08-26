# SoftProductivity — iOS App

A beautiful, modern productivity app built with **SwiftUI** that faithfully recreates the neumorphic / soft-UI design from the provided mockups.

![Design Mockup](design_mockup.jpg)

## Features

- **Home Dashboard**
  - Personalized welcome (“Welcome, Salung”)
  - Soft search bar with filter
  - Performance card with mini chart + live +3.45% badge
  - Projects section with interactive-style cards (line+bar chart & icon variants)
  - Today’s tasks list with status, avatars, and time

- **Schedule View** (opened via calendar icon)
  - Month picker (November 2026)
  - Interactive week day selector
  - Hourly timeline with color-coded event cards
  - Status labels (In Progress / Upcoming)
  - Avatar stacks & time ranges

- **Custom Floating Bottom Navigation**
  - Home · Analytics · Chat · Profile
  - Prominent floating “+” button that opens a New Item sheet

- **Soft Neumorphic Design System**
  - Warm light-gray background
  - Soft dual shadows (light + dark)
  - Generous corner radii (18–28pt)
  - Orange / green accent palette matching the original design
  - Fully light-mode optimized

## Screenshots of the original design

The original side-by-side iPhone mockups are included as `design_mockup.jpg`.

## How to Run

1. Open **Xcode 15+** (iOS 17+ recommended for best Charts support).
2. Create a new **iOS App** project:
   - Product Name: `SoftProductivity`
   - Interface: **SwiftUI**
   - Language: **Swift**
   - Uncheck “Include Tests” if you want a clean slate.
3. Delete the default `ContentView.swift` and `SoftProductivityApp.swift` that Xcode generates.
4. Copy the entire contents of the `SoftProductivity/` folder from this repository into your project’s root (or drag the files into the Xcode navigator).
5. Make sure all files are added to the app target.
6. Build & run on any iPhone simulator (or device).

> **Tip:** The project uses the native `Charts` framework (iOS 16+). No third-party dependencies.

## Project Structure

```
SoftProductivity/
├── SoftProductivityApp.swift      # App entry point
├── ContentView.swift              # Tab root + placeholders + New Item sheet
├── Models/
│   ├── Models.swift               # Project, TaskItem, ScheduleEvent + sample data
│   └── Theme.swift                # SoftTheme colors + SoftCard modifier
└── Views/
    ├── HomeView.swift
    ├── ScheduleView.swift
    └── Components/
        ├── BottomNavBar.swift
        ├── SearchBar.swift
        ├── PerformanceCard.swift
        ├── ProjectCard.swift
        ├── TaskCard.swift
        └── EventCard.swift
```

## Customization

- Change the user name in `HomeView` and `ProfilePlaceholder`.
- Swap sample data in `Models.swift`.
- Adjust colors in `Theme.swift` — everything is centralized.
- The “+” button already presents a simple create sheet; extend it as needed.

## Design Notes

The UI deliberately stays very close to the original mock:

- Same hierarchy and card layout
- Matching orange performance chart & green positive indicators
- Same event card style with left accent bars and avatar stacks
- Floating capsule nav + offset black “+” button
- Soft continuous corner radii and dual-direction shadows for the neumorphic feel

Enjoy building on top of it! 🚀

---

Made with ❤️ by Grok · Design fidelity recreation · August 2026
