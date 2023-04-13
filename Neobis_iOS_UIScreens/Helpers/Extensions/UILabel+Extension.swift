//
//  UILabel+Extension.swift
//  Neobis_iOS_UIScreens
//
//  Created by G G on 14.04.2023.
//

import Foundation
import UIKit

extension UILabel {
    
    convenience init(fonName: String,
                     fontSize: CGFloat,
                     labelText: String,
                     fontColor: UIColor) {
        self.init()
        self.font = UIFont(name: fonName, size: fontSize)
        self.textColor = fontColor
        self.text = labelText
        self.contentMode = .scaleToFill
        self.textAlignment = .center
    }
}
