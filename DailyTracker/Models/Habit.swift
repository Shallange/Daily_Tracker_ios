//
//  Habit.swift
//  DailyTracker
//
//  Created by Jimmy kroneld on 2026-04-29.
//

import Foundation
import SwiftData

@Model
final class Habit {
    var id: UUID = UUID()
    var name: String
    var createdAt: Date

    // Stores dates when this habit/task is completed
    var completedDates: [Date] = []

    init(name: String) {
        self.name = name
        self.createdAt = Date()
    }
}

extension Habit {
    var currentStreak: Int {
        let calendar = Calendar.current

        // Normalize dates to midnight so time of day does not affect streaks
        let completedDays = Set(
            completedDates.map { date in
                calendar.startOfDay(for: date)
            }
        )

        var streak = 0
        var dayToCheck = calendar.startOfDay(for: Date())
        
        // Count backwards from today until a missing day breaks the streak
        while completedDays.contains(dayToCheck) {
            streak += 1

            guard let previousDay = calendar.date(
                byAdding: .day,
                value: -1,
                to: dayToCheck
            ) else {
                break
            }

            dayToCheck = previousDay
        }

        return streak
    }
}

