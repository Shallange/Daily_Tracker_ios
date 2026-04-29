//
//  ContentView.swift
//  DailyTracker
//
//  Created by Jimmy kroneld on 2026-04-28.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Habit.createdAt, order: .reverse) private var habits: [Habit]
    @State private var newHabitName: String = ""

    var body: some View {
        NavigationStack {
            List(habits) { habit in
                Text(habit.name)
            }
            .navigationTitle("Daily Tracker")
            HStack {
                TextField("New Habit", text: $newHabitName)
                    .textFieldStyle(.roundedBorder)
                Button("Add") {
                    addHabit()
                }
            }
            .padding()
        }
    }
    private func addHabit() {
        let trimmedName = newHabitName.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        guard !trimmedName.isEmpty else {
            return
        }

        let habit = Habit(name: trimmedName)
        modelContext.insert(habit)
        newHabitName = ""
    }
}

#Preview {
    ContentView()
}
