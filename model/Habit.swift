import SwiftUI
struct Habit : Identifiable, Codable{
    let id:UUID
    var name: String
    var entries:[HabitEntry]
    var createdAt: Date 
    
    var totalMinutes: Int{
        entries.reduce(0){$0 + $1.minutes}
    }
    
    init(id:UUID = UUID(),name:String, entries:[HabitEntry]=[], createdAt:Date=Date()){
        self.id=id
        self.name=name
        self.entries=entries
        self.createdAt=createdAt
    }
}



//
//  Habit.swift
//  iHabit
//
//  Created by Megi  on 13.07.25.
//

