//
//  HabitListItemView.swift
//  DailyTracker
//
//  Created by Jimmy kroneld on 2026-05-02.
//

import SwiftUI

struct HabitListItemView: View {
    let habit: Habit
    let isCompletedToday: Bool

    var body: some View {
        HStack {
            Image(
                systemName: isCompletedToday
                    ? "checkmark.circle.fill"
                    : "circle"
            )
            .foregroundStyle(isCompletedToday ? .green : .secondary)

            VStack(alignment: .leading, spacing: 4) {
                Text(habit.name)
                    .font(.headline)

                Text(streakText)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private var streakText: String {
        let dayWord = habit.currentStreak == 1 ? "day" : "days"
        return "Current streak: \(habit.currentStreak) \(dayWord) 🔥"
    }
}
