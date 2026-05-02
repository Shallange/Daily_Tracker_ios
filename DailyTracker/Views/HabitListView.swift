//
//  ContentView.swift
//  DailyTracker
//
//  Created by Jimmy kroneld on 2026-04-28.
//

import SwiftData
import SwiftUI

struct HabitListView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var viewModel = HabitViewModel()

    @Query(sort: \Habit.createdAt, order: .reverse) private var habits: [Habit]

    var body: some View {
        @Bindable var viewModel = viewModel
        NavigationStack {
            List {
                ForEach(habits) { habit in
                    HabitListItemView(
                        habit: habit,
                        isCompletedToday: viewModel.isCompletedToday(habit)
                    )
                    .swipeActions(edge: .leading) {
                        Button {
                            viewModel.markCompletedToday(habit)
                        } label: {
                            Label("Done", systemImage: "checkmark.circle")
                        }
                        .tint(.green)
                    }
                }
                .onDelete { offsets in
                    viewModel.deleteHabits(
                        at: offsets,
                        from: habits,
                        context: modelContext
                    )
                }
            }
            .navigationTitle("Daily Tracker")

            HStack {
                TextField("New Habit", text: $viewModel.newHabitName)
                    .textFieldStyle(.roundedBorder)
                Button("Add") {
                    viewModel.addHabit(context: modelContext)
                }
            }
            .padding()
        }
    }
}

#Preview {
    HabitListView()
}
