//
//  WeatherWeekScreen.swift
//  Neobis_iOS_UIScreens
//
//  Created by G G on 07.04.2023.
//

import Foundation
import UIKit

class WeatherWeekScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension WeatherWeekScreen {
    
    private func viewsSetup() {
        viewSetup()
    }
    
    private func viewSetup() {
        let gradient = CAGradientLayer()
        let startColor = UIColor(hexString: "#47BFDF")
        let endColor = UIColor(hexString: "#4A91FF")
        gradient.frame = view.bounds
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        
        view.layer.insertSublayer(gradient, at: 0)
        
        navigationController?.isNavigationBarHidden = false
    }
}
