//
//  DailyTrackerApp.swift
//  DailyTracker
//
//  Created by Jimmy kroneld on 2026-04-28.
//

import SwiftUI
import SwiftData

@main
struct DailyTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Habit.self)
    }
}
