//
//  PlantDetail.swift
//  Plant Database
//
//  Created by Molly Anderson on 3/6/24.
//

import SwiftUI

struct PlantDetail: View {
    @Environment(ModelData.self) var modelData
    var plant: Plant
    
    var plantIndex: Int {
        modelData.plants.firstIndex(where: { $0.id == plant.id })!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text(plant.commonName)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.plants[plantIndex].isFavorite)
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
    let modelData = ModelData()
    return PlantDetail(plant: ModelData().plants[0])
        .environment(modelData)
}
