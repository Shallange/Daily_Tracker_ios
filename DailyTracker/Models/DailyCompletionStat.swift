//
//  DailyCompletionStat.swift
//  DailyTracker
//
//  Created by Jimmy kroneld on 2026-05-04.
//

import Foundation

struct DailyCompletionStat: Identifiable {
    let id = UUID()
    let date: Date
    let count: Int
}
