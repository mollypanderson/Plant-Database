//
//  Plant_DatabaseApp.swift
//  Plant Database
//
//  Created by Molly Anderson on 3/6/24.
//

import SwiftUI
import SwiftData

@main
struct Plant_DatabaseApp: App {
   // @StateObject private var modelData = ModelData()
    @Query(sort: \Plant.id, order: .reverse) private var plants: [Plant]
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer (for: [Plant.self])
    }
}
