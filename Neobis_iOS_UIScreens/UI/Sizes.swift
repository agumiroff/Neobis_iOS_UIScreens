//
//  Sizes.swift
//  Neobis_iOS_UIScreens
//
//  Created by G G on 07.04.2023.
//

import Foundation

enum Sizes {
    
    static var screenWidth = Constraints.screenWidth
    static var screenHeight = Constraints.screenHeight

    static private let layoutWidth = 414.0
    static private let layoutHeight = 896.0

    static private let proportionWidth = screenWidth/layoutWidth
    static private let proportionHeight = screenHeight/layoutHeight
    
    enum MainWeatherScreen {
        enum Date {
            static let fontSize = 18.0
        }
        
        enum ExtraLargeSize {
            static let fontSize = getConstraint(side: .height, size: 100)
        }
        
        enum Degree {
            static let fontSize = getConstraint(side: .height, size: 100)
        }
        
        enum LargeSize {
            static let fontSize = 24.0
        }
        
        enum Default {
            static let fontSize = 18.0
        }
    }
    
    enum ScreenSide {
        case width
        case height
    }
}

extension Sizes {
    static private func getConstraint(side: ScreenSide, size: Double) -> CGFloat {
        switch side {
        case .height:
            return size * Sizes.proportionHeight
        case .width:
            return size * Sizes.proportionWidth
        }
    }
}

enum Fonts {
    static let regular = "Overpass-Regular"
    static let semiBold = "Overpass-SemiBold"
    static let bold = "Overpass-Bold"
}
