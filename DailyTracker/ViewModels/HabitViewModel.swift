//
//  HabitViewModel.swift
//  DailyTracker
//
//  Created by Jimmy kroneld on 2026-04-30.
//

import Foundation
import SwiftData

@Observable
final class HabitViewModel {
    var newHabitName = ""
    var errorMessage: String?

    func addHabit(context: ModelContext) {
        let trimmedName = newHabitName.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        guard !trimmedName.isEmpty else {
            errorMessage = "Habit name cannot be empty."
            return
        }

        let habit = Habit(name: trimmedName)
        context.insert(habit)

        do {
            try context.save()
            newHabitName = ""
        } catch {
            errorMessage = "Could not save habit: \(error.localizedDescription)"
        }
    }

    func deleteHabits(
        at offsets: IndexSet,
        from habits: [Habit],
        context: ModelContext
    ) {
        for index in offsets {
            let habit = habits[index]
            context.delete(habit)
        }
        do {
            try context.save()
        } catch {
            errorMessage =
                "Could not delete habit: \(error.localizedDescription)"
        }
    }

    func isCompletedToday(_ habit: Habit) -> Bool {
        habit.completedDates.contains { date in
            Calendar.current.isDateInToday(date)
        }
    }

    func markCompletedToday(_ habit: Habit, context: ModelContext) {
        let isAlreadyCompletedToday = habit.completedDates.contains {
            date in
            Calendar.current.isDateInToday(date)
        }

        guard !isAlreadyCompletedToday else {
            return
        }

        habit.completedDates.append(Date())
        do {
            try context.save()
        } catch {
            errorMessage =
                "Could not update habit: \(error.localizedDescription)"
        }
    }
}
