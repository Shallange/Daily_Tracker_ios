//
//  StatsDashboardView.swift
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
        habits.map(\.currentStreak).max() ?? 0
    }

    private var weeklyCompletionStats: [DailyCompletionStat] {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())

        return (0..<7).reversed().compactMap { daysAgo in

            guard
                let date = calendar.date(
                    byAdding: .day,
                    value: -daysAgo,
                    to: today
                )
            else {
                return nil
            }
            return DailyCompletionStat(date: date, count: 0)
        }
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
                Section("Last 7 days") {
                    ForEach(weeklyCompletionStats) { stat in
                        HStack {
                            Text(
                                stat.date.formatted(
                                    date: .abbreviated,
                                    time: .omitted
                                )
                            )
                            Spacer()
                            Text("\(stat.count)")
                                .foregroundStyle(.secondary)
                        }
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
