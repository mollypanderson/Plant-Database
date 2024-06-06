//
//  PlantDetail.swift
//  Plant Database
//
//  Created by Molly Anderson on 3/6/24.
//

import SwiftUI
import SwiftData

struct PlantDetail: View {
    @State private var commonName: String = ""
    @State private var scientificName: String = ""
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    let plant: Plant
    
//    var plantIndex: Int {
//        plant.firstIndex(where: { $0.id == plant.id })!
//    }
    
    var body: some View {
        @State var isFavorite: Bool = plant.isFavorite
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text(plant.commonName)
                        .font(.title)
                    FavoriteButton(isSet: $isFavorite)
                }


                HStack {
                    Text(plant.scientificName)
                    Spacer()
                    Text(plant.dateAdopted)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)


                Divider()
                
//                PlantImage(image: plant.image)
//                    .offset(y: -130)
//                    .padding(.bottom, -130)

                Text("About \(plant.commonName)")
                    .font(.title2)
                Text("Adopted from: " + plant.adoptedFrom)
               // Text("Pot size: " + plant.potSizeInInches.tostr + "'")
                Text("Soil mix: " + plant.soilMix)
            }
            .padding()
        }
        .navigationTitle(plant.commonName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
  //  let modelContext = ModelContext()
  //  return PlantDetail(plant: ModelData().plants[0])
  //      .environment(modelData)
    
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Plant.self, configurations: config)

    let plants = Plant.sampleData
    return PlantDetail(plant: plants[0])
        .modelContainer(container)
}
