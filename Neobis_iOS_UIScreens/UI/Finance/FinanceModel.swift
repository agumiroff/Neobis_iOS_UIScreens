//
//  FinanceModel.swift
//  Neobis_iOS_UIScreens
//
//  Created by G G on 10.04.2023.
//

import Foundation
import SwiftUI

struct FinanceModel: Identifiable {
    var id = UUID()
    
    let imageName: String
    let color: Color
    let categoryName: String
    let itemName: String
    let amount: Int
}
