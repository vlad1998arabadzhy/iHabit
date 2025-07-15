import SwiftUI

struct StatCardView: View{
    let title: String
    let value: String

    var body: some View{
        VStack{
            Text(value)
                .font(.title)
                .fontWeight
                .foregroundStyle(.blue)

                Text(title)
                    .font(.caption)
                    .foregroundStyle(secondary)
                    
        }
        .frame(maxWidth:.infinity)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
}