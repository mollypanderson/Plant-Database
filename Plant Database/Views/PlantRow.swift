//
//  PlantRow.swift
//  Plant Database
//
//  Created by Molly Anderson on 3/6/24.
//

import SwiftUI

struct PlantRow: View {
    var plant: Plant
    
    var body: some View {
        HStack {
            plant.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(plant.commonName)
            
            Spacer()
            
            if plant.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview {
    let plants = ModelData().plants
    return Group {
        PlantRow(plant: plants[0])
        PlantRow(plant: plants[1])
    }
    
}
