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
            List {
                ForEach(habits) { habit in
                    HStack {
                        Image(
                            systemName: isCompletedToday(habit)
                                ? "checkmark.circle.fill" : "circle"
                        )
                        .foregroundStyle(
                            isCompletedToday(habit) ? .green : .secondary
                        )
                        Text(habit.name)
                    }
                    .swipeActions(edge: .leading) {
                        Button {
                            markCompletedToday(habit)
                        } label: {
                            Label("Done", systemImage: "checkmark.circle")
                        }
                        .tint(.green)
                    }
                }
                .onDelete(perform: deleteHabits)
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

    private func deleteHabits(at offsets: IndexSet) {
        for index in offsets {
            let habit = habits[index]
            modelContext.delete(habit)
        }
    }
    
    private func isCompletedToday(_ habit: Habit) -> Bool {
        habit.completedDates.contains { date in
            Calendar.current.isDateInToday(date)
        }
    }

    private func markCompletedToday(_ habit: Habit) {
        let isAlreadyCompletedToday = habit.completedDates.contains {
            date in
            Calendar.current.isDateInToday(date)
        }

        guard !isAlreadyCompletedToday else {
            return
        }

        habit.completedDates.append(Date())
    }
}

#Preview {
    ContentView()
}
