import SwiftUI

struct HabitListView: View{
    @StateObject private var habitManager = HabitManager()
    @State private var showingAddHabit = false
    @State private var newHabit = ""
    
    
    var body:some View{
        NavigationView{
            if hasNoHabit(habitManager:habitManager){
                emtyView()
            }else {
                mainView(habitManager:habitManager)
            }
            
        }.navigationTitle("My Habits")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button(action:{
                        showingAddHabit = true
                    }){
                        Image(systemName: "plus")
                    }
                    
                }
            }.sheet(isPresented: $showingAddHabit){
                AddHabitView(habitManager:habitManager)
            }
    }
    
  
    
    
    func emtyView()->some View{
         VStack(spacing: 20){
            Image(systemName: "checkmark.circle")
                .font(.system(size:60))
                .foregroundStyle(.gray)
            Text("No habit set")
                .font(.title2)
                .foregroundStyle(.gray)
            Text("Add your first habbit")
                .foregroundStyle(.green)
        }
        
    }
    
    
    func  hasNoHabit(habitManager: HabitManager)->Bool{
        return habitManager.habits.isEmpty
    }


    func mainView( habitManager:HabitManager)-> some View{
        List{
            ForEach(habitManager.habits){habit in
                NavigationLink(destination: HabitDetailView(habit: habit, habitManager: habitManager)) {
                    HabitRawView(habit:habit)
                }
            }
            .onDelete(perform: habitManager.deleHabit)
            
        }
        
        }

}






//
//  HabitListView.swift
//  iHabit
//
//  Created by Megi  on 14.07.25.
//

