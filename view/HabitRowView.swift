import SwiftUI


struct HabitRowView: View{
    let habit: Habit
    
    var body: some View{
        HStack{
            VStack(alignment: .leading, spacing:4){
                Text(habit.name)
                    .font(.headline)
                Text("Total: \(habit.totalMinutes/60) hrs." )
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                if let lastEntry = habit.entries.last{
                    Text("Last time: \(formatDate(lastEntry.date))")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            Spacer()
            VStack(alignment: .trailing){
                Text("\(habit.entries.count)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
                Text("reports")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
            }
            
        }
        .padding(.vertical, 4)
    }
    
    private func formatDate(_ date: Date)-> String{
        date.formatted(date: .abbreviated, time: .shortened)
        
        
    }
    
    
}
#Preview {
    let entries:[HabitEntry]=[
        HabitEntry(minutes:10),
        HabitEntry(minutes:10)
    ]
    let habit = Habit(name: "Habit", entries: entries, createdAt: Date())
    HabitRowView(habit:habit)
}

//
//  HabitRowView.swift
//  iHabit
//
//  Created by Megi  on 14.07.25.
//

