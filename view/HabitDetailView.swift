import SwiftUI

//
//  HabitDetailView.swift
//  iHabit
//
//  Created by Megi  on 14.07.25.
//
struct HabitDetailView: View{
    let habit: Habit

    @ObservableObject var habitManager: HabitManager
    @State private var showingAddEntry = false
    @State private var currentHabit: Habit

    init(habit: Habit, habitManager: HabitManager){
        self.habit = habit
        self.habitManager = habitManager
        self._currentHabit = State(initialValue: habit)        
    }   

    var body: some View{
        VStack(spacing:16){
            //Stat
            HStack{
                StatCardView(title:"Total time", value: "\(currentHabit.totalMinutes/60) hrs.")
                StatCardView(title:"Records:", value:"\(currentHabit.entries.count)")

            }
            if let avgMinutes = averageMinutes{
                StatCardView(title:"Average time per session", value:"\(avgMinutes/60) hrs.")
                    .frame(maxMidth: .infinity)
            }

        }.padding()

        List{
            ForEach(currentHabit.entries.sorted(by:{$0.date > $1.date})){
                entry in EntryRowView(entry: entry)
            }
        }.listStyle(PlainListStyle())
    }
    .navigationTitle(currentHabit.name)
    .navigationBarTitleDisplayMode(.large)
    .toolbar{
        ToolbarItem(placement: .navigationBarTrailing){
            Button(action:{
                showingAddEntry = true
        }){
            Image(systemName: "plus")
            }
        }
    }.sheet(isPresented: $showingAddEntry){
        AddEntryView(habit: currentHabit, habitManager: habitManager){
            updateCurrentHabit()
        }    
    }.onAppear{
        updateCurrentHabit()
    }

    private var averageMinutes: Int?{
        guard !currentHabit.entries.isEmpty else {return nil}
        return currentHabit.totalMinutes / currentHabit.entries.count
    }

    private func updateCurrentHabit(){
        if let updatedHabit =  habitManager.habits.first(where: {$0.is == habit.id}){
            currentHabit = updatedHabit
        }

    }
}