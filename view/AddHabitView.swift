import SwiftUI

struct AddHabitView:View{
    @ObservedObject var habitManager:HabitManager
    @Environment(\.dismiss) var dismiss
    @State private var habitName = ""
    
    var body:some View{
        NavigationView{
            Form{
                Section(header: Text("Name of the habit")){
                    TextField("For example: Reading", text: $habitName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                    Section{
                        Button(action: {
                            if !habitName.isEmpty{
                                habitManager.addHabit(name: habitName)
                                dismiss()
                                
                            }
                        }){
                            Text("Save habit")
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(habitName.isEmpty ? .gray : .blue)
                            
                        }
                        .disabled(habitName.isEmpty)
                    }
                    
            }
            .navigationTitle("New Habit")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button("Cancel"){dismiss()})
            }
        }
        
    }
    






//
//  AddHabitView.swift
//  iHabit
//
//  Created by Megi  on 14.07.25.
//

