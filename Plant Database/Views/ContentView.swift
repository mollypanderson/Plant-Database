//
//  ContentView.swift
//  Plant Database
//
//  Created by Molly Anderson on 3/6/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(sort: \Plant.id, order: .reverse) private var plants: [Plant]
    @Environment(\.modelContext) private var modelContext
    @State private var isPresentingNewPlantView: Bool = false
    
    var body: some View {
        TabView {
            NavigationStack {
                OverviewTab(allPlants: plants)
                    .navigationDestination(for: Plant.self) {
                        plant in OverviewTab(allPlants: plants)
                    }
            }
            .tabItem {
                Label("Overview", systemImage: "list.bullet.rectangle.portrait")
            }
          //  .sheet(isPresented: $isPresentingNewPlantView) {
              //  NewPlantSheet(plants: plants, isPresentingNewPlantView: $isPresentingNewPlantView)
           // }
          //  .onChange(of: scenePhase) { phase in
          //      if phase == .inactive { saveAction() }
          //  }
            
            
            BulkActionView()
                .tabItem {
                    Label("Bulk Action", systemImage: "checklist.checked")
                }
            
            AddView()
                .tabItem {
                    Label("", systemImage: "plus.circle.fill")
                }
            
            ReportsView()
                .tabItem {
                    Label("Reports", systemImage: "chart.xyaxis.line")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            
        }
        .onAppear() {
            UITabBar.appearance().unselectedItemTintColor = UIColor(red: 153 / 255, green: 153 / 255, blue: 153 / 255, alpha: 1)
        }
        .tint(Color(red: 185 / 255, green: 203 / 255, blue: 157 / 255))
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    let config = ModelConfiguration(isStoredInMemoryOnly: true)
//    let container = try! ModelContainer(for: Plant.self, configurations: config)
//    
//    for plant in Plant.sampleData {
//        container.mainContext.insert(plant)
//    }
//    
//    static var previews: some View {
//        return ContentView()
//            .modelContainer(container)
//    }
//}

@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: Plant.self,
                                           configurations: .init(isStoredInMemoryOnly: true))
        for plant in Plant.sampleData {
            container.mainContext.insert(plant);
        }
        return container;
    } catch {
        fatalError("Failed to create container")
    }
}()

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Plant.self, configurations: config)

    for plant in Plant.sampleData {
        container.mainContext.insert(plant)
    }
    
    return ContentView()
        .modelContainer(previewContainer)
}
