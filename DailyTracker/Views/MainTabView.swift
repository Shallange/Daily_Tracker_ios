//
//  MainTabView.swift
//  DailyTracker
//
//  Created by Jimmy kroneld on 2026-05-04.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HabitListView()
                .tabItem {
                    Label("Tracker", systemImage: "checklist")
                }

            StatsDashboardView()
                .tabItem {
                    Label("Progress", systemImage: "chart.bar")
                }
        }
        .tint(.green)
    }
}

#Preview {
    MainTabView()
}
