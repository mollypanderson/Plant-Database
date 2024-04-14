//
//  PlantRow.swift
//  Plant Database
//
//  Created by Molly Anderson on 3/6/24.
//

import SwiftUI

struct PlantRow: View {
    
    var plant: Plant
    var deepGreen = Color(red: 92.0 / 255, green: 134.0 / 255, blue: 81.0 / 255)
    var overdueRed = Color(red: 171.0 / 255, green: 33.0 / 255, blue: 33.0 / 255)
    
    // Locale and calendar
    let gregorianCalendar = Calendar(identifier: .gregorian)
    let dateFormatter = DateFormatter()
    
    func createFormatter() {
        dateFormatter.dateStyle = .full
    }
    
    var body: some View {
        let daysLate = gregorianCalendar.dateComponents(
          [.day],
          from: plant.nextRepotDate,
          to: Date()
        )
  
        VStack {
            VStack {
                Text(plant.commonName)
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundStyle(deepGreen)
                    .frame(maxWidth: .infinity)
            }
            VStack {
                HStack {
                    plant.image
                        .resizable()
                        .frame(width: 250, height: 250)
                        .frame(alignment: .center)
                    }
            }
            VStack {
                List {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("late? \(plant.overdue)")
                        Text("🪴 Repot")
                            .padding(.top, 8)
                            .bold()
                        Text("(**\(daysLate.day!) days** overdue)")
                            .foregroundStyle(overdueRed)
                            .padding(.bottom, 10)
                    }
                    .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .swipeActions(allowsFullSwipe: false) {
                            Button {
                                print("ok")
                            } label: {
                                Label("Dismiss", systemImage: "zzz")
                            }
                            .tint(.gray)
                            Button {
                                print("ok")
                            } label: {
                                Label("Done", systemImage: "checkmark")
                            }
                            .tint(deepGreen)
                    }
                }
                .listStyle(.plain)
                .frame(minHeight: 100)
            }
           // .frame(minHeight: 900)
        }
        
            
        
    }
}

#Preview {
    let plants = ModelData().plants
    return Group {
        PlantRow(plant: plants[0])
    }
    
}
