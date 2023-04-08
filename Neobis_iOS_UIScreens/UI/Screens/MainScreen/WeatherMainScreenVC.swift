//
//  ViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by G G on 05.04.2023.
//

import UIKit
import SnapKit

class WeatherMainScreenVC: UIViewController {
    
    //MARK: Properties
    private let locationLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "location")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let cityName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Бишкек"
        label.font = UIFont(name: "Overpass-Bold",
                            size: Constraints.MainWeatherScreen.CityName.fontSize)
        label.textColor = .white
        label.shadowOffset = CGSize(width: -2, height: 3)
        label.shadowColor = UIColor(white: CGFloat(0), alpha: 0.1)
        return label
    }()
    
    private let chevron: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "chevron")
        return imageView
    }()
    
    private let notifications = UIView()
    
    private let notificationsLogo = UIImageView(image: UIImage(named: "notification"))
    
    private let notificationsDot = UIImageView(image: UIImage(named: "dot"))
    
    private let leftCurvedLine: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "lineLeft")
        return imageView
    }()
    
    private let rightCurvedLine: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "lineRight")
        return imageView
    }()
    
    private let sunImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "sun")
        imageView.image = image
        return imageView
    }()
    
    private let sunGlow: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .redraw
        imageView.image = UIImage(named: "glow")
        return imageView
    }()
    
    private let informationView = InformationView()
    
    private let weekWeatherButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "chevron.up")
        var configuration = UIButton.Configuration.filled()
        button.setImage(image, for: .normal)
        configuration.baseBackgroundColor = .white
        configuration.baseForegroundColor = .black
        configuration.cornerStyle = .large
        configuration.title = "Прогноз на неделю"
        button.semanticContentAttribute = .forceRightToLeft
        button.configuration = configuration
        button.addTarget(self, action: #selector(weekScreenRoute), for: .touchUpInside)
        return button
    }()
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "#47BFDF")
        setupViews()
    }
}

//MARK: Views setup
extension WeatherMainScreenVC {
    
    func setupViews() {
        viewSetup()
        locationLogoSetup()
        cityNameSetup()
        chevronSetup()
        notificationSetup()
        leftCurvedLineSetup()
        rightCurvedLineSetup()
        sunGlowSetup()
        informationSetup()
        weekWeatherButtonSetup()
    }
    
    private func viewSetup() {
        let gradient = CAGradientLayer()
        let startColor = UIColor(hexString: "#47BFDF")
        let endColor = UIColor(hexString: "#4A91FF")
        gradient.frame = view.bounds
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        
        view.layer.insertSublayer(gradient, at: 0)
    }
        
    func locationLogoSetup() {
        view.addSubview(locationLogo)
        
        locationLogo.snp.makeConstraints { make in
            make.top.equalTo(Constraints.MainWeatherScreen.LocationLogo.top)
            make.left.equalTo(Constraints.MainWeatherScreen.LocationLogo.left)
            make.height.equalTo(Constraints.MainWeatherScreen.LocationLogo.height)
            make.width.equalTo(Constraints.MainWeatherScreen.LocationLogo.width)
        }
    }
    
    func cityNameSetup() {
        view.addSubview(cityName)
        
        cityName.snp.makeConstraints { make in
            make.left.equalTo(locationLogo.snp.right).offset(Constraints.MainWeatherScreen.CityName.left)
            make.centerY.equalTo(locationLogo.snp.centerY)
        }
    }
    
    func chevronSetup() {
        view.addSubview(chevron)
        
        chevron.snp.makeConstraints { make in
            make.left.equalTo(cityName.snp.right).offset(Constraints.MainWeatherScreen.Chevron.left)
            make.centerY.equalTo(cityName.snp.centerY)
        }
    }
    
    func notificationSetup() {
        
        view.addSubview(notifications)
        
        notifications.snp.makeConstraints { make in
            make.right.equalTo(-Constraints.MainWeatherScreen.Notifications.viewRight)
            make.centerY.equalTo(locationLogo.snp.centerY)
            make.height.equalTo(Constraints.MainWeatherScreen.Notifications.viewHeigh)
            make.width.equalTo(Constraints.MainWeatherScreen.Notifications.viewWidth)
        }
        
        
        notifications.addSubview(notificationsLogo)
        
        notificationsLogo.snp.makeConstraints { make in
            make.left.equalTo(Constraints.MainWeatherScreen.Notifications.bellLeft)
            make.top.equalTo(Constraints.MainWeatherScreen.Notifications.belltop)
            make.width.equalTo(Constraints.MainWeatherScreen.Notifications.bellWidth)
            make.height.equalTo(Constraints.MainWeatherScreen.Notifications.bellHeight)
        }
        
        notifications.addSubview(notificationsDot)
        
        notificationsDot.snp.makeConstraints { make in
            make.top.equalTo(Constraints.MainWeatherScreen.Notifications.dotTop)
            make.left.equalTo(Constraints.MainWeatherScreen.Notifications.dotLeft)
        }
    }
    
    func leftCurvedLineSetup() {
        view.addSubview(leftCurvedLine)
        
        leftCurvedLine.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(Constraints.MainWeatherScreen.LeftCurvedLine.left)
            make.top.equalTo(Constraints.MainWeatherScreen.LeftCurvedLine.top)
            make.width.equalTo(Constraints.MainWeatherScreen.LeftCurvedLine.width)
            make.height.equalTo(Constraints.MainWeatherScreen.LeftCurvedLine.height)
        }
    }
    
    func rightCurvedLineSetup() {
        
        view.addSubview(rightCurvedLine)
        
        rightCurvedLine.snp.makeConstraints { make in
            make.left.equalTo(Constraints.MainWeatherScreen.RightCurvedLine.left)
            make.top.equalTo(Constraints.MainWeatherScreen.RightCurvedLine.top)
            
        }
    }
    
    func sunGlowSetup() {
        view.addSubview(sunGlow)
        
        sunGlow.snp.makeConstraints { make in
            make.top.equalTo(Constraints.MainWeatherScreen.Sunglow.top)
            make.centerX.equalTo(view.snp.centerX)
            make.width.height.equalTo(Constraints.MainWeatherScreen.Sunglow.height)
        }
        
        sunGlow.contentMode = .scaleAspectFit
        
        
        view.addSubview(sunImage)
        sunImage.snp.makeConstraints { make in
            make.centerX.equalTo(sunGlow.snp.centerX)
            make.centerY.equalTo(sunGlow.snp.centerY)
            make.width.height.equalTo(Constraints.MainWeatherScreen.Sun.height)
        }
    }
    
    func informationSetup() {
        view.addSubview(informationView)
        
        informationView.snp.makeConstraints { make in
            make.top.equalTo(Constraints.MainWeatherScreen.Information.top)
            make.left.equalTo(Constraints.MainWeatherScreen.Information.left)
            make.right.equalTo(Constraints.MainWeatherScreen.Information.right)
            make.height.equalTo(Constraints.MainWeatherScreen.Information.height)
        }
    }
    
    func weekWeatherButtonSetup() {
        view.addSubview(weekWeatherButton)
        
        weekWeatherButton.snp.makeConstraints { make in
            make.left.equalTo(Constraints.MainWeatherScreen.Button.left)
            make.right.equalTo(Constraints.MainWeatherScreen.Button.right)
            make.height.equalTo(Constraints.MainWeatherScreen.Button.height)
            make.bottom.equalTo(Constraints.MainWeatherScreen.Button.bottom)
        }
    }
    
    @objc func weekScreenRoute() {
        let transition = CATransition()
        
        transition.duration = 0.3
        transition.type = .moveIn
        transition.subtype = .fromTop
        
        navigationController?.view.layer.add(transition, forKey: nil)
        navigationController?.pushViewController(WeatherWeekScreenVC(), animated: false)
    }
}
