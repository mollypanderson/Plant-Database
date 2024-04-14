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
    
    var pastDueHeader = Color(red: 215.0 / 255, green: 155.0 / 255, blue: 100.0 / 255)
    var upcomingColor = Color(red: 145.0 / 255, green: 128.0 / 255, blue: 99.0 / 255)

    var allPlants: [Plant] {
        modelData.plants
    }
    
    var overduePlants: [Plant] {
        modelData.plants.filter { plant in
            (plant.overdue)
        }
    }
    
    var upcomingPlants: [Plant] {
        modelData.plants.filter { plant in
            (!plant.overdue)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Section() {
                    ForEach(overduePlants) {
                        plant in NavigationLink {
                            PlantDetail(plant: plant)
                        } label: {
                            VStack(alignment: .leading) {
                                PlantRow(plant: plant)
                            }
                        }
                        
                    }
                } header: {
                    Section {
                        Text("Past due")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                            
                    }
                    .frame(maxWidth: .infinity, minHeight: 65, alignment: .leading)
                    .background(pastDueHeader)
                }
                Section {
                    ForEach(upcomingPlants) {
                        plant in NavigationLink {
                            PlantDetail(plant: plant)
                        } label: {
                            VStack(alignment: .leading) {
                                PlantRow(plant: plant)
                            }
                        }
                        
                    }
                } header: {
                    Section {
                        Text("Upcoming")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                            
                    }
                    .frame(maxWidth: .infinity, minHeight: 65, alignment: .leading)
                    .background(upcomingColor)
                }
            }
            .listStyle(.plain)
            .animation(.default, value: allPlants)
            .navigationTitle("My Plant Database")
            .navigationBarTitleDisplayMode(.inline)
            .fontWeight(.regular)
            .foregroundStyle(deepGreen)
            .frame(maxWidth: .infinity)
            .toolbar {
                Button {
                    showingSort = true
                } label: {
                    Label("Sort", systemImage: "arrow.up.arrow.down")
                }
                .tint(Color(red: 92 / 255, green: 134 / 255, blue: 81 / 255))
                .searchable(text: /*@PLACEHOLDER=$text@*/.constant("")/*@END_MENU_TOKEN@*/, placement: /*@START_MENU_TOKEN@*/.automatic)
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
