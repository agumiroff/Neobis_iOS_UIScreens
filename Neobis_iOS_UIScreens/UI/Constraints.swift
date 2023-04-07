//
//  Constraints.swift
//  Neobis_iOS_UIScreens
//
//  Created by G G on 06.04.2023.
//

import Foundation
import UIKit

enum Constraints {

    static var screenWidth = 0.0
    static var screenHeight = 0.0

    static private let layoutWidth = 414.0
    static private let layoutHeight = 896.0

    static private let proportionWidth = screenWidth/layoutWidth
    static private let proportionHeight = screenHeight/layoutHeight

    enum MainWeatherScreen {
        
        enum LocationRow {
            static let left = getConstraint(side: .width, size: 34)
            static let top = getConstraint(side: .height, size: 52)
            static let width = getConstraint(side: .width, size: 197)
            static let height = getConstraint(side: .height, size: 37)
        }
        
        enum LocationLogo {
            static let left = getConstraint(side: .width, size: 31)
            static let top = getConstraint(side: .height, size: 59)
            static let width = getConstraint(side: .width, size: 24)
            static let height = getConstraint(side: .height, size: 24)
            
        }
        
        enum CityName {
            static let left = getConstraint(side: .width, size: 23)
            static let top = getConstraint(side: .height, size: 52)
            static let height = getConstraint(side: .height, size: 37)
            static let width = getConstraint(side: .width, size: 100)
            static let fontSize = getConstraint(side: .height, size: 24)
        }
        
        enum Chevron {
            static let left = getConstraint(side: .width, size: 34)
            static let top = getConstraint(side: .height, size: 61)
            static let width = getConstraint(side: .width, size: 8.49)
            static let height = getConstraint(side: .height, size: 5.66)
        }
        
        enum Notifications {
            static let viewRight = getConstraint(side: .width, size: 35)
            static let viewHeigh = getConstraint(side: .width, size: 24)
            static let viewWidth = getConstraint(side: .width, size: 24)
            static let bellHeight = getConstraint(side: .width, size: 21.5)
            static let bellWidth = getConstraint(side: .width, size: 18)
            static let bellLeft = getConstraint(side: .width, size: 3)
            static let belltop = getConstraint(side: .width, size: 2)
            static let dotLeft = getConstraint(side: .width, size: 16.0)
            static let dotTop = getConstraint(side: .width, size: 2.0)
        }
        
        enum LeftCurvedLine {
            static let left = getConstraint(side: .width, size: -20)
            static let top = getConstraint(side: .height, size: 92)
            static let width = getConstraint(side: .width, size: 112)
            static let height = getConstraint(side: .height, size: 235)
        }
        
        enum RightCurvedLine {
            static let left = getConstraint(side: .width, size: 59)
            static let top = getConstraint(side: .height, size: -54)
            static let width = getConstraint(side: .width, size: 425)
            static let height = getConstraint(side: .height, size: 366.5)
        }
        
        enum Sunglow {
            static let top = getConstraint(side: .height, size: 77.22)
            static let width = getConstraint(side: .width, size: 242)
            static let height = getConstraint(side: .height, size: 242)
        }
        
        enum Sun {
            static let height = getConstraint(side: .height, size: 96.05)
            static let width = getConstraint(side: .width, size: 96.05)
        }
        
        enum Information {
            static let top = getConstraint(side: .height, size: 361)
            static let left = getConstraint(side: .height, size: 31)
            static let right = getConstraint(side: .height, size: -31)
            static let height = getConstraint(side: .height, size: 353)
        }
        
        enum Date {
            static let top = getConstraint(side: .height, size: 17)
        }
        
        enum Temperature {
            static let top = getConstraint(side: .height, size: 14)
        }
        
        enum Degree {
            static let left = getConstraint(side: .width, size: 6)
        }
        
        enum WeatherDescription {
            static let top = getConstraint(side: .height, size: 137)
        }
        
        enum WindIcon {
            static let top = getConstraint(side: .height, size: 36)
            static let left = getConstraint(side: .width, size: 69)
            static let width = getConstraint(side: .width, size: 20)
        }
        
        enum RainIcon {
            static let top = getConstraint(side: .height, size: 22.27)
            static let left = getConstraint(side: .width, size: 69)
            static let width = getConstraint(side: .width, size: 20)
        }
        
        enum WindSpeed {
            static let left = getConstraint(side: .height, size: 20)
        }
        
        enum Humidity {
            static let left = getConstraint(side: .height, size: 20)
        }
        
        enum Button {
            static let left = getConstraint(side: .width, size: 83)
            static let right = getConstraint(side: .width, size: -83)
            static let height = getConstraint(side: .height, size: 64)
            static let bottom = getConstraint(side: .height, size: -36)
            
            static let cornerRadius = getConstraint(side: .height, size: 20)
        }
        
        enum WeekScreen {
            
        }
    }


    enum ScreenSide {
        case width
        case height
    }


}

extension Constraints {
    static private func getConstraint(side: ScreenSide, size: Double) -> CGFloat {
        switch side {
        case .height:
            return size * Constraints.proportionHeight
        case .width:
            return size * Constraints.proportionWidth
        }
    }
}
