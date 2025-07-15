import SwiftUI

class HabitManager: ObservableObject{
    @Published var habits: [Habit]=[]
    init(){
        loadHabits()
    }
    
    func addHabit(name: String){
        let habit = Habit(name: name)
        habits.append(habit)
        saveHabit()
        
    }
    func addEntry(to habit: Habit, minutes:Int, note:String=""){
        if let index = habits.firstIndex(where: {$0.id == habit.id}){
            let entry = HabitEntry(minutes: minutes, note: note)
            habits[index].entries.append(entry)
            saveHabit()
        }
    }
    func saveHabit(){
        if let encoded = try? JSONEncoder().encode(habits){
            UserDefaults.standard.set(encoded, forKey: "habits")
        }
    }
    func deleHabit(at offsets: IndexSet){
        habits.remove(atOffsets: offsets)
        saveHabit()
    }
    func loadHabits(){}
    
}
