//
//  iHabitApp.swift
//  iHabit
//
//  Created by Megi  on 12.07.25.
//

import SwiftUI
import SwiftData

@main
struct iHabitApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
           
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            
        }
        .modelContainer(sharedModelContainer)
    }
    
}
