//
//  PlantList.swift
//  Plant Database
//
//  Created by Molly Anderson on 3/6/24.
//

import SwiftUI

struct OverviewTab: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var deepGreen = Color(red: 92.0 / 255, green: 134.0 / 255, blue: 81.0 / 255)

    var filteredPlants: [Plant] {
        modelData.plants.filter { plant in
            (!showFavoritesOnly || plant.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredPlants) {
                    plant in NavigationLink {
                        PlantDetail(plant: plant)
                    } label: {
                        PlantRow(plant: plant)
                    }
                }
            }
            .animation(.default, value: filteredPlants)
            .navigationTitle("My Plant Database")
            .fontWeight(.regular)
            .foregroundStyle(deepGreen)
            
        }
        .fontWeight(.light)
    }
    //.tabItem { "Overview" }
}


#Preview {
    OverviewTab()
        .environment(ModelData())
}
