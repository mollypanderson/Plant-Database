//
//  Plant.swift
//  Plant Database
//
//  Created by Molly Anderson on 3/6/24.
//

import Foundation
import SwiftUI
import SwiftData

@Model
final class Plant: Identifiable {
    @Attribute(.unique) var id: String = UUID().uuidString
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
    var nextSoilCheck: Date
    var nextFertilizer: Date
    var overdue: Bool {
        return (
            nextRepotDate < Date()
            || nextSoilCheck < Date()
            || nextFertilizer < Date()
        );
    }
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    //Calendar.current.date(byAdding: .day, value: 7, to: Date());
    
    init(id: String = UUID().uuidString, commonName: String, scientificName: String,
         dateAdopted: String, adoptedFrom: String, potSizeInInches: Int, soilMix: String,
         isFavorite: Bool = false, repottingHistory: [Date] = [], repottingCadenceInDays: Int = 7,
         nextRepotDate: Date = Calendar.current.date(byAdding: .day, value: 365, to: Date())!, nextSoilCheck: Date = Date(), nextFertilizer: Date = Date(), imageName: String) {
        self.id = id
        self.commonName = commonName
        self.scientificName = scientificName
        self.dateAdopted = dateAdopted
        self.adoptedFrom = adoptedFrom
        self.potSizeInInches = potSizeInInches
        self.soilMix = soilMix
        self.isFavorite = isFavorite
        self.repottingHistory = repottingHistory
        self.repottingCadenceInDays = repottingCadenceInDays
        self.nextRepotDate = nextRepotDate
        self.nextSoilCheck = nextSoilCheck
        self.nextFertilizer = nextFertilizer
        self.imageName = imageName
    }
}

extension Plant {
    static let sampleData: [Plant] = [
        Plant(commonName: "Monstera A", scientificName: "Monstera deliciosa", dateAdopted: "11/2022", adoptedFrom: "Cactus + Co, Camano Island", potSizeInInches: 12, soilMix: "1 part miracle gro potting soil, 1 part perlite, 1 part charcoal, 1 part orchid bark, 1 part coco chips", isFavorite: true, repottingHistory: [Date()], repottingCadenceInDays: 365, nextRepotDate: Date(), nextSoilCheck: Date(), nextFertilizer: Date(), imageName: "monsterapic"),
        Plant(commonName: "Bird of Paradise A", scientificName: "Strelitzia nicolai", dateAdopted: "8/21/2023", adoptedFrom: "Lowe's North Seattle", potSizeInInches: 10, soilMix: "4 parts potting mix, 1 part perlite, 2 parts orchid bark, 1 part coco chips, 1/2 part charcoal", isFavorite: false, repottingHistory: [Date()], repottingCadenceInDays: 365, nextRepotDate: Date(), nextSoilCheck: Date(), nextFertilizer: Date(), imageName: "bopapic")
    ]
}

//func saveToDocuments(plant: Plant) {
//    let encoder = JSONEncoder()
//    encoder.outputFormatting = .prettyPrinted
//    do {
//        let data = try encoder.encode(Plant)
//        let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        let path = filePath.appendingPathComponent("person.json")
//        try data.write(to: path)
//        print("json file saved to path \(path.path)")
//    } catch {
//        print("error saving json")
//    }
//}
//
//func retrieveDataFromFile() {
//    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//    let fileUrl = documentsDirectory.appendingPathComponent("plantData.json")
//    do {
//        let decoder = try JSONDecoder()
//        let data = try Data(contentsOf: fileURL)
//        let decodedData = try decoder.decode(Plant.self, from: data)
//        print(decodedData)
//    } catch {
//        print("error")
//    }
//}
