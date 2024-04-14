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
    
    @State private var showingSort = false
        @State private var selection = "None"
    
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
            .navigationTitle("Overview")
            .fontWeight(.regular)
            .foregroundStyle(deepGreen)
            .toolbar {
                Button {
                    showingSort = true
                } label: {
                    Label("Sort", systemImage: "arrow.up.arrow.down")
                }
                .tint(Color(red: 92 / 255, green: 134 / 255, blue: 81 / 255))
                .searchable(text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=$text@*/.constant("")/*@END_MENU_TOKEN@*/, placement: /*@START_MENU_TOKEN@*/.automatic/*@END_MENU_TOKEN@*/)
            }
            
        }
        .fontWeight(.light)
        .confirmationDialog("Sort by...", isPresented: $showingSort, titleVisibility: .visible) {
                ForEach([
                    "Date of Next Action",
                    "Date Adopted (Ascending)",
                    "Date Adopted (Descending)",
                    "Alphabetical by Name",
                    "Alphabetical by Species",
                    "Custom (Drag & Drop)"
                ], id: \.self) { sort in
                    Button(sort) {
                        selection = sort
                    }
                }
            }
        }
    }
        



#Preview {
    OverviewTab()
        .environment(ModelData())
}
