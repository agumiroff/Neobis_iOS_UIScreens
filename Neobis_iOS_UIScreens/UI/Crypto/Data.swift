//
//  Data.swift
//  Neobis_iOS_UIScreens
//
//  Created by G G on 08.04.2023.
//

import Foundation

enum Data {
    
    static let arrayOfData = [randomData(),
                              randomData(),
                              randomData(),
                              randomData(),
                              randomData(),
                              randomData(),
                              randomData(),
                              randomData(),
                              randomData(),
                              randomData(),
                              randomData(),
                              randomData(),
                              randomData(),
                              randomData(),
    ]
    
    
}

extension Data {
    
    static private func randomData() -> CryptoModel {
        let random = Int.random(in: 1...4)
        switch random {
        case 1:
            return CryptoModel(logo: "BTC",
                        name: "Bitcoin",
                        shortName: "BTC",
                        price: randomValue(low: 14000, max: 30000),
                        profit: randomValue(low: -30, max: 30),
                        count: randomValue(low: 1, max: 30))
        case 2:
            return CryptoModel(logo: "ETH",
                        name: "Etherium",
                        shortName: "ETH",
                        price: randomValue(low: 14000, max: 30000),
                        profit: randomValue(low: -30, max: 30),
                        count: randomValue(low: 1, max: 30))
        case 3:
            return CryptoModel(logo: "LTC",
                        name: "Litecoin",
                        shortName: "LTC",
                        price: randomValue(low: 14000, max: 30000),
                        profit: randomValue(low: -30, max: 30),
                        count: randomValue(low: 1, max: 30))
        case 4:
            return CryptoModel(logo: "XRP",
                        name: "Ripple",
                        shortName: "XRP",
                        price: randomValue(low: 14000, max: 30000),
                        profit: randomValue(low: -30, max: 30),
                        count: randomValue(low: 1, max: 30))
        default:
            break
        }
        
        return CryptoModel(logo: "XRP",
                    name: "Ripple",
                    shortName: "XRP",
                    price: randomValue(low: 14000, max: 30000),
                    profit: randomValue(low: -30, max: 30),
                    count: randomValue(low: 1, max: 30))
    }
    
    static private func randomValue(low: Double, max: Double) -> Double{
        let random = Double.random(in: ClosedRange(uncheckedBounds: (lower: low, upper: max)))
        let roundedDouble = Double(round(1000 * random) / 1000)
        return roundedDouble
    }
}
