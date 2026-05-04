//
//  DashboardView.swift
//  DailyTracker
//
//  Created by Jimmy kroneld on 2026-05-04.
//

import SwiftUI
import SwiftData

struct StatsDashboardView: View {
    @Query private var habits: [Habit]
    
    private var totalHabits: Int {
        habits.count
    }
    
    var body: some View {
        NavigationStack {
            List{
                Section("Overview"){
                    HStack{
                        Text("Total habits")
                        Spacer()
                        Text("\(totalHabits)")
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
