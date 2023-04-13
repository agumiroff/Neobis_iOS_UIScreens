//
//  ShortInfoView.swift
//  Neobis_iOS_UIScreens
//
//  Created by G G on 07.04.2023.
//

import Foundation
import UIKit

class ShortInfoView: UIView {
    
    let cloudImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let starImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.regular, size: FontSizes.MainWeatherScreen.defaultSize)
        label.layer.shadowOpacity = 0.1
        label.layer.shadowRadius = 1
        label.layer.shadowOffset = CGSize(width: -2, height: 3)
        label.layer.position = label.center
        label.textColor = .white
        label.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.regular, size: FontSizes.MainWeatherScreen.defaultSize)
        label.layer.shadowOpacity = 0.1
        label.layer.shadowRadius = 1
        label.layer.shadowOffset = CGSize(width: -2, height: 3)
        label.layer.position = label.center
        label.textColor = .white
        label.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        return label
    }()
    
    
    init(frame: CGRect, model: WeatherModel) {
        
        super.init(frame: frame)
        self.cloudImage.image = model.cloudImage
        self.starImage.image = model.starImage
        self.temperatureLabel.text = model.temperature
        self.timeLabel.text = model.time
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(temperatureLabel)
        addSubview(starImage)
        addSubview(cloudImage)
        addSubview(timeLabel)
        
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(Constraints.WeekScreen.TemperatureLabel.top)
            make.centerX.equalTo(snp.centerX)
        }
        
        starImage.snp.makeConstraints { make in
            make.centerY.equalTo(snp.centerY).offset(Constraints.WeekScreen.StarImage.vertical)
            make.centerX.equalTo(snp.centerX).offset(Constraints.WeekScreen.StarImage.horizontal)
            make.height.width.equalTo(Constraints.WeekScreen.StarImage.width)
        }
        
        cloudImage.snp.makeConstraints { make in
            make.centerY.equalTo(snp.centerY)
            make.centerX.equalTo(snp.centerX)
            make.width.equalTo(Constraints.WeekScreen.CloudImage.width)
            make.height.equalTo(Constraints.WeekScreen.CloudImage.height)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.bottom.equalTo(Constraints.WeekScreen.TimeLabel.bottom)
            make.centerX.equalTo(snp.centerX)
        }
    }
}
