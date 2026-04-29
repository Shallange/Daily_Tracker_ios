//
//  Habit.swift
//  DailyTracker
//
//  Created by Jimmy kroneld on 2026-04-29.
//

import Foundation
import SwiftData

@Model
final class Habit{
    var id: UUID = UUID()
    var name: String
    var createdAt: Date
    
    init(name: String) {
        self.name = name
        self.createdAt = Date()
    }
}
