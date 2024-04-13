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
    
    var body: some View {
        VStack {
            VStack {
                Text(plant.commonName)
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundStyle(deepGreen)
            }
            VStack {
                HStack {
                    plant.image
                        .resizable()
                        .frame(width: 250, height: 250)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Spacer()
                  //  Image(systemName: "star.fill")
                    //    .foregroundStyle(.yellow)
                }
            }
            VStack {
                Text("hello")
            }
            Spacer()
        }
        
    }
}

#Preview {
    let plants = ModelData().plants
    return Group {
        PlantRow(plant: plants[0])
    }
    
}
