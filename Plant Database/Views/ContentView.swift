//
//  ContentView.swift
//  Plant Database
//
//  Created by Molly Anderson on 3/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                OverviewTab()
                    .navigationDestination(for: Plant.self) {
                        plant in OverviewTab()
                    }
            }
            .tabItem {
                Label("Overview", systemImage: "list.bullet.rectangle.portrait")
            }
            
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

#Preview {
    ContentView()
        .environment(ModelData()     )
}
