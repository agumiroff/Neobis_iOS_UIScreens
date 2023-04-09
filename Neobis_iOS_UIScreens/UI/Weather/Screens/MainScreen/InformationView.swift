//
//  InformationView.swift
//  Neobis_iOS_UIScreens
//
//  Created by G G on 06.04.2023.
//

import Foundation
import UIKit
import SnapKit

class InformationView: UIView {
    
    let date = UILabel(fonName: Fonts.regular,
                       fontSize: Sizes.MainWeatherScreen.Date.fontSize,
                       labelText: "Сегодня, 26 Апрель",
                       fontColor: .white)
    
    let temperature: UILabel = {
        let label = UILabel()
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 50
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowOffset = CGSize(width: -4, height: 8)
        label.font = UIFont(name: Fonts.semiBold,
                            size: Sizes.MainWeatherScreen.ExtraLargeSize.fontSize)
        label.text = "22"
        label.textColor = .white
        return label
    }()
    
    let degree: UILabel = {
        let label = UILabel()
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 50
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowOffset = CGSize(width: -4, height: 8)
        label.font = UIFont(name: Fonts.semiBold,
                            size: Sizes.MainWeatherScreen.Degree.fontSize)
        label.text = "°"
        label.textColor = .white
        return label
    }()
    
    let weatherDescription: UILabel = {
        let label = UILabel()
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 1
        label.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowOffset = CGSize(width: -2, height: 3)
        label.font = UIFont(name: Fonts.semiBold,
                            size: Sizes.MainWeatherScreen.LargeSize.fontSize)
        label.text = "Солнечно"
        label.textColor = .white
        return label
    }()
    
    
    let windLabel = UILabel(fonName: Fonts.regular,
                            fontSize: Sizes.MainWeatherScreen.Default.fontSize,
                            labelText: "Ветер",
                            fontColor: .white)
    
    let rainLabel = UILabel(fonName: Fonts.regular,
                            fontSize: Sizes.MainWeatherScreen.Default.fontSize,
                            labelText: "Дождь",
                            fontColor: .white)
    
    let windDivider = UILabel(fonName: Fonts.regular,
                              fontSize: Sizes.MainWeatherScreen.Default.fontSize,
                              labelText: "|",
                              fontColor: .white)
    
    let rainDivider = UILabel(fonName: Fonts.regular,
                              fontSize: Sizes.MainWeatherScreen.Default.fontSize,
                              labelText: "|",
                              fontColor: .white)
    
    let windSpeed = UILabel(fonName: Fonts.regular,
                            fontSize: Sizes.MainWeatherScreen.Default.fontSize,
                            labelText: "15 km/h",
                            fontColor: .white)
    
    let humidity = UILabel(fonName: Fonts.regular,
                           fontSize: Sizes.MainWeatherScreen.Default.fontSize,
                           labelText: "26 %",
                           fontColor: .white)
    
    let windIcon = UIImageView(image: UIImage(named: "windIcon"))
    let rainIcon = UIImageView(image: UIImage(named: "rainIcon"))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSetup()
        dateSetup()
        temperatureSetup()
        degreeSetup()
        weatherDescriptionSetup()
        windIconSetup()
        rainIconSetup()
        windDividerSetup()
        rainDividerSetup()
        windLabelSetup()
        rainLabelSetup()
        windSpeedSetup()
        humiditySetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func viewSetup() {
        backgroundColor = UIColor(white: 1, alpha: 0.3)
        layer.cornerRadius = 20
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2
    }
    
    func dateSetup() {
        addSubview(date)
        
        date.snp.makeConstraints { make in
            make.top.equalTo(Constraints.MainWeatherScreen.Date.top)
            make.centerX.equalTo(snp.centerX)
        }
    }
    
    func temperatureSetup() {
        addSubview(temperature)
        
        temperature.snp.makeConstraints { make in
            make.top.equalTo(date.snp.bottom)
            make.centerX.equalTo(snp.centerX)
        }
    }
    
    func degreeSetup() {
        addSubview(degree)
        
        degree.snp.makeConstraints { make in
            make.top.equalTo(temperature.snp.top)
            make.left.equalTo(temperature.snp.right).offset(Constraints.MainWeatherScreen.Degree.left)
        }
    }
    
    
    func weatherDescriptionSetup() {
        addSubview(weatherDescription)
        
        weatherDescription.snp.makeConstraints { make in
            make.centerX.equalTo(snp.centerX)
            make.top.equalTo(temperature.snp.bottom)
        }
    }
    
    func windIconSetup() {
        addSubview(windIcon)
        
        windIcon.snp.makeConstraints { make in
            make.top.equalTo(weatherDescription.snp.bottom).offset(Constraints.MainWeatherScreen.WindIcon.top)
            make.left.equalTo(Constraints.MainWeatherScreen.WindIcon.left)
            make.width.equalTo(Constraints.MainWeatherScreen.WindIcon.width)
        }
    }
    
    func rainIconSetup() {
        addSubview(rainIcon)
        
        rainIcon.snp.makeConstraints { make in
            make.top.equalTo(windIcon.snp.bottom).offset(Constraints.MainWeatherScreen.RainIcon.top)
            make.left.equalTo(Constraints.MainWeatherScreen.RainIcon.left)
            make.width.equalTo(Constraints.MainWeatherScreen.RainIcon.width)
        }
    }
    
    func windDividerSetup() {
        addSubview(windDivider)
        
        windDivider.snp.makeConstraints { make in
            make.centerY.equalTo(windIcon.snp.centerY)
            make.centerX.equalTo(snp.centerX)
        }
    }
    
    func rainDividerSetup() {
        addSubview(rainDivider)
        
        rainDivider.snp.makeConstraints { make in
            make.centerY.equalTo(rainIcon.snp.centerY)
            make.centerX.equalTo(snp.centerX)
        }
    }
    
    func windLabelSetup() {
        addSubview(windLabel)
        
        windLabel.textAlignment = .center
        
        windLabel.snp.makeConstraints { make in
            make.left.equalTo(windIcon.snp.right).offset(5)
            make.centerY.equalTo(windIcon.snp.centerY)
            make.right.equalTo(windDivider.snp.left).offset(-5)
        }
    }
    
    func rainLabelSetup() {
        addSubview(rainLabel)
        
        rainLabel.textAlignment = .center
        
        rainLabel.snp.makeConstraints { make in
            make.left.equalTo(rainIcon.snp.right).offset(5)
            make.centerY.equalTo(rainIcon.snp.centerY)
            make.right.equalTo(rainDivider.snp.left).offset(-5)
        }
    }
    
    func windSpeedSetup() {
        addSubview(windSpeed)
        
        windSpeed.snp.makeConstraints { make in
            make.centerY.equalTo(windDivider.snp.centerY)
            make.left.equalTo(windDivider.snp.right).offset(Constraints.MainWeatherScreen.WindSpeed.left)
        }
    }
    
    func humiditySetup() {
        addSubview(humidity)
        
        humidity.snp.makeConstraints { make in
            make.centerY.equalTo(rainDivider.snp.centerY)
            make.left.equalTo(rainDivider.snp.right).offset(Constraints.MainWeatherScreen.Humidity.left)
        }
    }
}

extension UILabel {
    
    convenience init(fonName: String,
                     fontSize: CGFloat,
                     labelText: String,
                     fontColor: UIColor) {
        self.init()
        self.font = UIFont(name: fonName, size: fontSize)
        self.textColor = fontColor
        self.text = labelText
    }
}
