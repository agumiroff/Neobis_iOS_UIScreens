//
//  TravelModel.swift
//  Neobis_iOS_UIScreens
//
//  Created by G G on 11.04.2023.
//

import Foundation

struct TravelModel: Identifiable {
    var id = UUID()
    
    let imageName: String
}

enum TravelData {
    static let array = [
        TravelModel(imageName: "abu"),
        TravelModel(imageName: "san"),
        TravelModel(imageName: "abu"),
        TravelModel(imageName: "san"),
    ]
}
