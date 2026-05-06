
# DailyTracker

DailyTracker is a simple iOS habit tracking app built with SwiftUI and SwiftData.


## Features

- Add new habits
- Delete habits with swipe actions
- Mark habits as completed for today
- Prevent duplicate completions on the same day
- Show current streak for each habit
- Show validation errors when input is empty
- Save data locally with SwiftData
- View progress statistics in a separate tab
- Display weekly completions with SwiftUI Charts

## Tech Stack

- Swift
- SwiftUI
- SwiftData
- SwiftUI Charts
- MVVM-style structure

## App Flow

![DailyTracker App Flow](docs/app-flow.png)

## Screenshots

<table>
  <tr>
    <td align="center">
      <strong>Tracker empty state</strong><br>
      <img src="docs/screenshots/tracker-empty-state.png" width="300" alt="Tracker empty state" />
    </td>
    <td align="center">
      <strong>Tracker habit list</strong><br>
      <img src="docs/screenshots/tracker-habit-list.png" width="300" alt="Tracker habit list" />
    </td>
  </tr>
  <tr>
    <td align="center">
      <strong>Swipe to complete</strong><br>
      <img src="docs/screenshots/tracker-swipe-complete.png" width="300" alt="Swipe to complete a habit" />
    </td>
    <td align="center">
      <strong>Swipe to delete</strong><br>
      <img src="docs/screenshots/tracker-swipe-delete.png" width="300" alt="Swipe to delete a habit" />
    </td>
  </tr>
  <tr>
    <td align="center">
      <strong>Progress dashboard</strong><br>
      <img src="docs/screenshots/progress-dashboard.png" width="300" alt="Progress dashboard with overview and chart" />
    </td>
    <td align="center">
      <strong>Progress empty state</strong><br>
      <img src="docs/screenshots/progress-empty-state.png" width="300" alt="Empty progress dashboard" />
    </td>
  </tr>
</table>