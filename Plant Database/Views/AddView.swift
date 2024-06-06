//
//  AddView.swift
//  Plant Database
//
//  Created by Molly Anderson on 4/13/24.
//

import SwiftUI

struct AddView: View {
    @State private var commonName = ""
    @State private var scientificName = ""
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    private var isFormValid: Bool {
        return !commonName.isEmpty && !scientificName.isEmpty
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        NavigationView {
            Form {
                TextField("common name", text: $commonName)
                TextField("scientific name", text: $scientificName)
                Button("Save") {
                    let plant = Plant(commonName: commonName, scientificName: scientificName, dateAdopted: "", adoptedFrom: "", potSizeInInches: 4, soilMix: "", imageName: "")
                    context.insert(plant)
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    dismiss()
                }.disabled(!isFormValid)
            }
            .navigationTitle("Add a plant")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Close") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddView()
}
