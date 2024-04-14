//
//  Plant.swift
//  Plant Database
//
//  Created by Molly Anderson on 3/6/24.
//

import Foundation
import SwiftUI

struct Plant: Hashable, Codable, Identifiable {
    var id: Int
    var commonName: String
    var scientificName: String
    var dateAdopted: String
    var adoptedFrom: String
    var potSizeInInches: Int
    var soilMix: String
    var isFavorite: Bool
    var repottingHistory: Array<Date>
    var repottingCadenceInDays: Int
    var nextRepotDate: Date
    var overdue: Bool {
        return nextRepotDate < Date();
    }
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
}
