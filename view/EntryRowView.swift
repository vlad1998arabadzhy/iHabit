import SwiftUI

struct EntryRowView:View{
    let entry: HabitEntry

    var body: some View{

        HStack{
            VStac(alignment: .leading, spacing: 4){
                Text("\(entry.minutes/60) hrs")
                    .font(.headline)
                Text(formatDate(entry.date))
                    .font(.caption)
                    .foregroundStyle(.secondary)

            if !entry.note.isEmpty{
                Text(entry.note){
                    .font(.caption)
                    .foregroundStyle(.blue)
                }
            }

            }
        
        Spacer()

        Image(systemName: "clock")
            .foregroundStyle(.blue)

        
        }
        .padding(.vertical, 5)
    }

    private func formatDate(_ date:Date)-> String{
        date.formatted(date: .abbreviated, time: .shortened)
    }

}