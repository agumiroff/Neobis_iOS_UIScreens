//
//  View+Extension.swift
//  Neobis_iOS_UIScreens
//
//  Created by G G on 10.04.2023.
//

import Foundation
import SwiftUI


extension View {
    
    func hAlign(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func vAlign(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
}
