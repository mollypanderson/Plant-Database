//
//  PlantIcon.swift
//  Plant Database
//
//  Created by Molly Anderson on 3/6/24.
//

import SwiftUI

struct PlantImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .frame(width: 100.0, height: 100.0)
    }
}

#Preview {
    PlantImage(image: Image("bopapic"))
}
