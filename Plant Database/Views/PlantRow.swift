//
//  PlantRow.swift
//  Plant Database
//
//  Created by Molly Anderson on 3/6/24.
//

import SwiftUI
import SwiftData

struct PlantRow: View {
    
    var plant: Plant
    var deepGreen = Color(red: 92.0 / 255, green: 134.0 / 255, blue: 81.0 / 255)
    var overdueRed = Color(red: 171.0 / 255, green: 33.0 / 255, blue: 33.0 / 255)
    
    @State var showRepotAction = false;
    @State var showDidYouWaterItAction = false;
    
    var actionItemsDisplayed: CGFloat = 1;
    
    // Locale and calendar
    let gregorianCalendar = Calendar(identifier: .gregorian)
    
     func showRepotActionItem() -> AnyView {
        return AnyView(
            VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("🪴 Repot")
                    .padding(.top, 8)
                    .bold()
                daysOverUnderText(nextActionDate: plant.nextRepotDate)
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
        })
    }
    
    func showSoilCheckActionItem() -> AnyView {
        return AnyView( VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("🚿 Check soil moisture")
                    .padding(.top, 8)
                    .bold()
                daysOverUnderText(nextActionDate: plant.nextSoilCheck)
            }
            .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
            .frame(maxWidth: .infinity, alignment: .leading)
            .swipeActions(allowsFullSwipe: false) {
                Button(role: .destructive) {
                       print("goodbye")
                    } label: {
                        Label("Dismiss", systemImage: "zzz")
                    }
                    .tint(.gray)
                    Button(role: .destructive) {
                    //    showCheckSoilMoistureView.toggle()
                    //    plant.nextSoilCheck = 1714471991;
                        showDidYouWaterItAction.toggle()
                    } label: {
                        Label("Done", systemImage: "checkmark")
                    }
                    .tint(deepGreen)
            }
        }
        )
    }
    
    func showFertilizerActionItem() -> AnyView {
        return AnyView( VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("🌱 Fertilizer")
                    .padding(.top, 8)
                    .bold()
                daysOverUnderText(nextActionDate: plant.nextFertilizer)
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
        )
    }
    
    private func showDidYouWaterItActionView() -> some View {
        Text("hiya buddy")
    }
    
    func daysOverUnderText(nextActionDate: Date) -> AnyView {
        let daysLate = gregorianCalendar.dateComponents(
          [.day],
          from: nextActionDate,
          to: Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        )
        
        if (daysLate.day! > 0) {
            return AnyView(
                Text("(**\(daysLate.day!) days** overdue)")
                    .foregroundStyle(overdueRed)
                    .padding(.bottom, 10)
            )
        }  else if (daysLate.day! == 0) {
            return AnyView(
                Text("(today)")
                    .foregroundStyle(deepGreen)
                    .padding(.bottom, 10)
            )
        } else if (daysLate.day! == -1) {
            return AnyView(
                Text("(tomorrow)")
                    .foregroundStyle(.gray)
                    .padding(.bottom, 10)
            )
        } else {
            return AnyView(
                Text("(in \(abs(daysLate.day!)) days)")
                    .foregroundStyle(.gray)
                    .padding(.bottom, 10)
            )
        }
    }
    
    var body: some View {
        var oneWeekFromToday = Calendar.current.date(byAdding: .day, value: 7, to: Date());
        
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
                    if (plant.nextRepotDate <= oneWeekFromToday!) {
                        showRepotActionItem()
                    }
                    if (plant.nextRepotDate <= oneWeekFromToday!) {
                        showSoilCheckActionItem()
                    }
                    if (plant.nextFertilizer <= oneWeekFromToday!) {
                        showFertilizerActionItem()
                    }
                    if (showDidYouWaterItAction) {
                        showDidYouWaterItActionView()
                    }
                }
                .listStyle(.plain)
            }
            .frame(minHeight: 225, maxHeight: .infinity)
        }
        
            
        
    }
    
}

#Preview {
//    let plants = ModelData().plants
//    return Group {
//        PlantRow(plant: plants[1])
//    }
    
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Plant.self, configurations: config)

    let plants = Plant.sampleData
    return Group {
        PlantRow(plant: plants[1])
            .modelContainer(container)
    }
    
  //  (allPlants: allPlants)
  //      .modelContainer(container)
    
}
