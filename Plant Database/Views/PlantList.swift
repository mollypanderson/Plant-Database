//
//  PlantList.swift
//  Plant Database
//
//  Created by Molly Anderson on 3/6/24.
//

import SwiftUI

struct PlantList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredPlants: [Plant] {
        modelData.plants.filter { plant in
            (!showFavoritesOnly || plant.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredPlants) { plant in
                    NavigationLink {
                        PlantDetail(plant: plant)
                    } label: {
                        PlantRow(plant: plant)
                    }
                }
            }
            .animation(.default, value: filteredPlants)
            .navigationTitle("my plant database")
            
        } detail: {
            Text("Select a plant")
        }
        .fontWeight(.light)
    }
}

#Preview {
    PlantList()
        .environment(ModelData())
}
