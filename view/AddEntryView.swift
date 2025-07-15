import SwiftUI

struct AddEntryView:View{
    let habit:Habit
    @ObservableObject habitManager: HabitManager
    let onSave:()-> Void
    
    @Environment(\.dismiss) var dismiss
    @State private var minutes= ""
    @State private var note = ""

    var body: some View{
        NavigationView{
            Form{
                Section(header: Text("Execution time")){
                    HStack{
                        TextField("0", text: $minutes)
                            .keyboardType
                    }
                }
            }
        }
    }
}