//
//  ContentView.swift
//  Plant Database
//
//  Created by Molly Anderson on 3/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PlantList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData()     )
}
