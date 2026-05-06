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
                if habits.isEmpty {
                    ContentUnavailableView(
                        "No habits added yet",
                        systemImage: "checklist",
                        description: Text("Add a new habit to get started!")
                    )
                } else {
                    ForEach(habits) { habit in
                        HabitListItemView(
                            habit: habit,
                            isCompletedToday: viewModel.isCompletedToday(habit)
                        )
                        .swipeActions(edge: .leading) {
                            Button {
                                viewModel.markCompletedToday(
                                    habit,
                                    context: modelContext
                                )
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
            }
            .navigationTitle("Daily Tracker")

            HStack {
                TextField("New Habit", text: $viewModel.newHabitName)
                    .textInputAutocapitalization(.sentences)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                Button {
                    viewModel.addHabit(context: modelContext)
                } label: {
                    Image(systemName: "plus")
                        .font(.headline)
                        .frame(width: 42, height: 42)
                        .background(.green)
                        .foregroundStyle(.white)
                        .clipShape(Circle())
                }
            }
            .padding()
            .alert(
                "Something went wrong",
                isPresented: Binding(
                    get: { viewModel.errorMessage != nil },
                    set: { if !$0 { viewModel.errorMessage = nil } }
                ),
                presenting: viewModel.errorMessage
            ) { _ in
                Button("OK", role: .cancel) {}
            } message: { message in
                Text(message)
            }
        }
    }
}

#Preview {
    HabitListView()
}
