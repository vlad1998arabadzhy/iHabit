import SwiftUI
struct HabitEntry:Codable, Identifiable{
    let id :UUID
    var minutes: Int
    var date: Date
    var note: String
    
    
    init(id:UUID = UUID(), minutes:Int, date:Date = Date(), note:String = ""){
        self.id = id
        self.minutes = minutes
        self.date = date
        self.note = note
    }
}



//
//  HabitEntry.swift
//  iHabit
//
//  Created by Megi  on 13.07.25.
//

