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
                       fontSize: FontSizes.MainWeatherScreen.defaultSize,
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
                            size: FontSizes.MainWeatherScreen.extraLargeSize)
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
                            size: FontSizes.MainWeatherScreen.extraLargeSize)
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
                            size: FontSizes.MainWeatherScreen.largeSize)
        label.text = "Солнечно"
        label.textColor = .white
        return label
    }()
    
    
    let windLabel = UILabel(fonName: Fonts.regular,
                            fontSize: FontSizes.MainWeatherScreen.defaultSize,
                            labelText: "Ветер",
                            fontColor: .white)
    
    let rainLabel = UILabel(fonName: Fonts.regular,
                            fontSize: FontSizes.MainWeatherScreen.defaultSize,
                            labelText: "Дождь",
                            fontColor: .white)
    
    let windDivider = UILabel(fonName: Fonts.regular,
                              fontSize: FontSizes.MainWeatherScreen.defaultSize,
                              labelText: "|",
                              fontColor: .white)
    
    let rainDivider = UILabel(fonName: Fonts.regular,
                              fontSize: FontSizes.MainWeatherScreen.defaultSize,
                              labelText: "|",
                              fontColor: .white)
    
    let windSpeed = UILabel(fonName: Fonts.regular,
                            fontSize: FontSizes.MainWeatherScreen.defaultSize,
                            labelText: "15 km/h",
                            fontColor: .white)
    
    let humidity = UILabel(fonName: Fonts.regular,
                           fontSize: FontSizes.MainWeatherScreen.defaultSize,
                           labelText: "26 %",
                           fontColor: .white)
    
    let windIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "wind")
        imageView.tintColor = .white
        return imageView
    }()
    
    let rainIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "drop")
        imageView.tintColor = .white
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = UIColor(white: 1, alpha: 0.3)
        layer.cornerRadius = 20
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2
        
        addSubview(date)
        addSubview(temperature)
        addSubview(degree)
        addSubview(weatherDescription)
        addSubview(windIcon)
        addSubview(rainIcon)
        addSubview(windDivider)
        addSubview(rainDivider)
        addSubview(windLabel)
        addSubview(rainLabel)
        addSubview(windSpeed)
        addSubview(humidity)
        
        
        date.snp.makeConstraints { make in
            make.top.equalTo(Constraints.MainWeatherScreen.Date.top)
            make.centerX.equalTo(snp.centerX)
        }
        
        temperature.snp.makeConstraints { make in
            make.top.equalTo(date.snp.bottom)
            make.centerX.equalTo(snp.centerX)
        }
        
        degree.snp.makeConstraints { make in
            make.top.equalTo(temperature.snp.top)
            make.left.equalTo(temperature.snp.right).offset(Constraints.MainWeatherScreen.Degree.left)
        }
        
        weatherDescription.snp.makeConstraints { make in
            make.centerX.equalTo(snp.centerX)
            make.top.equalTo(temperature.snp.bottom)
        }
        
        windIcon.snp.makeConstraints { make in
            make.centerY.equalTo(windLabel.snp.centerY)
            make.right.equalTo(windLabel.snp.left).offset(-15)
        }
        
        rainIcon.snp.makeConstraints { make in
            make.centerY.equalTo(rainLabel.snp.centerY)
            make.right.equalTo(rainLabel.snp.left).offset(-15)
        }
        
        windDivider.snp.makeConstraints { make in
            make.top.equalTo(weatherDescription.snp.bottom).offset(10)
            make.centerX.equalTo(snp.centerX)
        }
        
        rainDivider.snp.makeConstraints { make in
            make.top.equalTo(windDivider.snp.bottom).offset(10)
            make.centerX.equalTo(snp.centerX)
        }
        
        windLabel.snp.makeConstraints { make in
            make.centerY.equalTo(windDivider.snp.centerY)
            make.right.equalTo(windDivider.snp.left).offset(-15)
            make.width.equalTo(Constraints.MainWeatherScreen.WindLabel.width)
        }
        
        rainLabel.snp.makeConstraints { make in
            make.centerY.equalTo(rainDivider.snp.centerY)
            make.right.equalTo(rainDivider.snp.left).offset(-15)
            make.width.equalTo(Constraints.MainWeatherScreen.RainLabel.width)
        }
        
        windSpeed.snp.makeConstraints { make in
            make.centerY.equalTo(windDivider.snp.centerY)
            make.left.equalTo(windDivider.snp.right).offset(Constraints.MainWeatherScreen.WindSpeed.left)
        }
        
        humidity.snp.makeConstraints { make in
            make.centerY.equalTo(rainDivider.snp.centerY)
            make.left.equalTo(rainDivider.snp.right).offset(Constraints.MainWeatherScreen.Humidity.left)
        }
    }
}
