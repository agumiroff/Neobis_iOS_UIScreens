//
//  Router.swift
//  Neobis_iOS_UIScreens
//
//  Created by G G on 07.04.2023.
//

import Foundation

class Router {
    let navigationController = Navigation()
    
    func mainWeatherScreenRoute() {
        let view = WeatherMainScreenVC()
        
        navigationController.viewControllers = [view]        
    }
}
