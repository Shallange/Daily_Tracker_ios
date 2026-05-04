//
//  DashboardView.swift
//  DailyTracker
//
//  Created by Jimmy kroneld on 2026-05-04.
//

import SwiftData
import SwiftUI

struct StatsDashboardView: View {
    @Query private var habits: [Habit]

    private var totalHabits: Int {
        habits.count
    }

    private var totalCompletions: Int {
        habits.reduce(0) { total, habit in
            total + habit.completedDates.count
        }
    }
    
    private var bestStreak: Int {
        habits.map(\.completedDates.count).max() ?? 0
    }

    var body: some View {
        NavigationStack {
            List {
                Section("Overview") {
                    
                    HStack {
                        Text("Total habits")
                        Spacer()
                        Text("\(totalHabits)")
                            .foregroundStyle(.secondary)
                    }
                    
                    HStack {
                        Text("Total completions")
                        Spacer()
                        Text("\(totalCompletions)")
                            .foregroundStyle(.secondary)
                    }
                    
                    HStack {
                        Text("Best Streak")
                        Spacer()
                        Text("\(bestStreak) day\(bestStreak == 1 ? "" : "s")")
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Progress")
        }
    }
}

#Preview {
    StatsDashboardView()
}
