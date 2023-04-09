//
//  CryptoModel.swift
//  Neobis_iOS_UIScreens
//
//  Created by G G on 08.04.2023.
//

import Foundation
import UIKit


struct CryptoModel: Identifiable {
    var id = UUID()
    
    let logo: String
    let name: String
    let shortName: String
    let price: Double
    let profit: Double
    let count: Double
}
