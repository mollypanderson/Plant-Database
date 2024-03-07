//
//  Plant_DatabaseApp.swift
//  Plant Database
//
//  Created by Molly Anderson on 3/6/24.
//

import SwiftUI

@main
struct Plant_DatabaseApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
