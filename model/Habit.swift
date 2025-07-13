import SwiftUI
struct Habit{
    let id = UUID()
    var name: String
    var entries:[HabitEntry]=[]
    var createdAt: Date = Date()
    
    var totalMinutes: Int{
        entries.reduce(0){$0 + $1.minutes}
    }
}



//
//  Habit.swift
//  iHabit
//
//  Created by Megi  on 13.07.25.
//

