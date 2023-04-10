//
//  StackView+Extension.swift
//  Neobis_iOS_UIScreens
//
//  Created by G G on 06.04.2023.
//

import Foundation
import UIKit

extension UIStackView {
    func addArrangedSubviews(subViews: [UIView]) {
        for view in subViews {
            addArrangedSubview(view)
        }
    }
}
