//
//  Sizes.swift
//  Neobis_iOS_UIScreens
//
//  Created by G G on 07.04.2023.
//

import Foundation

enum FontSizes {
    
    static var screenWidth = Constraints.screenWidth
    static var screenHeight = Constraints.screenHeight

    static private let layoutWidth = 414.0
    static private let layoutHeight = 896.0

    static private let proportionWidth = screenWidth/layoutWidth
    static private let proportionHeight = screenHeight/layoutHeight
    
    enum MainWeatherScreen {
            static let extraLargeSize = getConstraint(side: .height, size: 100.0)
        
            static let largeSize = 24.0
        
            static let defaultSize = 18.0
    }
    
    enum ScreenSide {
        case width
        case height
    }
}

extension FontSizes {
    static private func getConstraint(side: ScreenSide, size: Double) -> CGFloat {
        switch side {
        case .height:
            return size * FontSizes.proportionHeight
        case .width:
            return size * FontSizes.proportionWidth
        }
    }
}

enum Fonts {
    static let regular = "Overpass-Regular"
    static let semiBold = "Overpass-SemiBold"
    static let bold = "Overpass-Bold"
}
