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
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTExtFieldStyle())
                        Text("minutes")
                            .foregroundStyle(.secondary)

                    }
                }

                Section(header: Text("Notes (optional)")){
                    TextField("How did it go?", text:$note)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Section{
                    Button(action: saveEntry){
                        Text("Save")
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(minutes.isEmpty ? .gray: .blue)
                    }
                    .disabled(minutes.isEmpty)
                }

            }
            .navigationTitle("New note")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button("Cancel"){
                    dismiss()
                }
                
                )
        }
    }

    private func saveEntry(){
        guard let minutesInt = Int(minutes), minutesInt > 0 else {return } 
    
        habitManager.addEntry(to: habit, minutes:minutesInt, note:note)
        onSave()
        dismiss()
    }
}