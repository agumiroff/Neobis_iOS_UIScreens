//
//  WeatherWeekScreen.swift
//  Neobis_iOS_UIScreens
//
//  Created by G G on 07.04.2023.
//

import Foundation
import UIKit

class WeatherWeekScreenVC: UIViewController{
  
    
    
//    MARK: Properties
    private let viewsArray = [
        WeatherModel(cloudImage: UIImage(named: "cloud_left")!, starImage: UIImage(named: "sun")!, temperature: "29°C", time: "15.00", date: "Апр, 27"),
        WeatherModel(cloudImage: UIImage(named: "cloud_left")!, starImage: UIImage(named: "sun")!, temperature: "29°C", time: "15.00", date: "Апр, 28"),
        WeatherModel(cloudImage: UIImage(named: "cloud_left")!, starImage: UIImage(named: "sun")!, temperature: "29°C", time: "15.00", date: "Апр, 29"),
        WeatherModel(cloudImage: UIImage(named: "cloud_left")!, starImage: UIImage(named: "sun")!, temperature: "29°C", time: "15.00", date: "Апр, 30"),
        WeatherModel(cloudImage: UIImage(named: "cloud_left")!, starImage: UIImage(named: "sun")!, temperature: "29°C", time: "15.00", date: "Мар, 1"),
        WeatherModel(cloudImage: UIImage(named: "cloud_left")!, starImage: UIImage(named: "sun")!, temperature: "29°C", time: "15.00", date: "Мар, 2"),
        WeatherModel(cloudImage: UIImage(named: "cloud_left")!, starImage: UIImage(named: "sun")!, temperature: "29°C", time: "15.00", date: "Мар, 3"),
    ]
    
    private let leftCurvedLine: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "lineLeft")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let rightCurvedLine: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "lineRight")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let todayLabel = UILabel(fonName: Fonts.bold,
                             fontSize: FontSizes.MainWeatherScreen.largeSize,
                             labelText: "Сегодня",
                             fontColor: .white)
    
    private let date = UILabel(fonName: Fonts.regular,
                             fontSize: FontSizes.MainWeatherScreen.defaultSize,
                             labelText: "Апр, 26",
                             fontColor: .white)
    
    private let shortInfoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 12
        return stack
    }()
    
    private let thisWeek = UILabel(fonName: Fonts.bold,
                             fontSize: FontSizes.MainWeatherScreen.largeSize,
                             labelText: "На этой неделе",
                             fontColor: .white)
    
    private let calendar: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "calendar")
        return imageView
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.allowsSelection = false
        table.backgroundColor = .none
        return table
    }()
    
    private let footerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "sun.max.fill")
        imageView.tintColor = .white
        return imageView
    }()
        
    let footerLabel: UILabel = {
        let label = UILabel()
        label.text = "AccuWeather"
        label.font = UIFont(name: Fonts.regular, size: FontSizes.MainWeatherScreen.defaultSize)
        label.layer.shadowOpacity = 0.1
        label.layer.shadowRadius = 1
        label.layer.shadowOffset = CGSize(width: -2, height: 3)
        label.layer.position = label.center
        label.textColor = .white
        label.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        return label
    }()
    
    let footer: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.spacing = 17
        return stack
    }()
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        viewsSetup()
    }
    
}

//MARK: Views setup
extension WeatherWeekScreenVC {
    
    private func viewsSetup() {
        viewSetup()
        navigationControllerSetup()
        leftCurvedLineSetup()
        rightCurvedLineSetup()
        todaySetup()
        dateSetup()
        shortInfoStackSetup()
        thisWeekSetup()
        calendarSetup()
        tableViewSetup()
        footerSetup()
    }
    
    private func viewSetup() {
        let gradient = CAGradientLayer()
        let startColor = UIColor(hexString: "#47BFDF")
        let endColor = UIColor(hexString: "#4A91FF")
        gradient.frame = view.bounds
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        
        view.layer.insertSublayer(gradient, at: 0)
        
    }
    
    private func navigationControllerSetup() {
        let tap = UITapGestureRecognizer()
        tap.numberOfTapsRequired = 1
        tap.addTarget(self, action:  #selector(pop(sender:)))
        let customView = BackButtonView()
        customView.addGestureRecognizer(tap)
        customView.isUserInteractionEnabled = true
       
        navigationItem.leftBarButtonItem = UIBarButtonItem()
        
        navigationController?.navigationBar.addSubview(customView)
        customView.snp.makeConstraints { make in
            make.left.equalTo(Constraints.WeekScreen.NavigationView.left)
            make.width.equalTo(Constraints.WeekScreen.NavigationView.width)
            make.top.bottom.equalToSuperview()
        }
        
        let configButton = UIBarButtonItem()
        configButton.image = UIImage(systemName: "gearshape")
        navigationItem.rightBarButtonItem = configButton
        navigationItem.rightBarButtonItem?.tintColor = .white
        
    }
    
    private func leftCurvedLineSetup() {
        view.addSubview(leftCurvedLine)
        
        leftCurvedLine.snp.makeConstraints { make in
            make.left.equalTo(Constraints.MainWeatherScreen.LeftCurvedLine.left)
            make.top.equalTo(Constraints.MainWeatherScreen.LeftCurvedLine.top)
            make.width.equalTo(Constraints.MainWeatherScreen.LeftCurvedLine.width)
            make.height.equalTo(Constraints.MainWeatherScreen.LeftCurvedLine.height)
        }
    }
    
    private func rightCurvedLineSetup() {
        
        view.addSubview(rightCurvedLine)
        
        rightCurvedLine.snp.makeConstraints { make in
            make.left.equalTo(Constraints.MainWeatherScreen.RightCurvedLine.left)
            make.top.equalTo(Constraints.MainWeatherScreen.RightCurvedLine.top)
            make.width.equalTo(Constraints.MainWeatherScreen.RightCurvedLine.width)
            make.height.equalTo(Constraints.MainWeatherScreen.RightCurvedLine.height)
            
        }
    }
    
    private func todaySetup() {
        view.addSubview(todayLabel)
        
        todayLabel.snp.makeConstraints { make in
            make.left.equalTo(Constraints.WeekScreen.Today.left)
            make.top.equalTo(Constraints.WeekScreen.Today.top)
        }
    }
    
    private func dateSetup() {
        view.addSubview(date)
        
        date.snp.makeConstraints { make in
            make.centerY.equalTo(todayLabel.snp.centerY)
            make.right.equalTo(Constraints.WeekScreen.Date.right)
        }
    }
    
    private func shortInfoStackSetup() {
        view.addSubview(shortInfoStack)
        
        shortInfoStack.snp.makeConstraints { make in
            make.top.equalTo(todayLabel.snp.bottom).offset(Constraints.WeekScreen.ShortInfoStack.top)
            make.left.right.equalToSuperview().inset(Constraints.WeekScreen.ShortInfoStack.left)
            make.height.equalTo(Constraints.WeekScreen.ShortInfoStack.height)
        }
        
        for index in 0...4 {
            if index == 2 {
                let currentView = ShortInfoView(frame: CGRect(), model: viewsArray[index])
                currentView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
                currentView.layer.borderColor = UIColor.white.cgColor
                currentView.layer.borderWidth = 2
                currentView.layer.cornerRadius = 20
                shortInfoStack.addArrangedSubview(currentView)
            } else {
                shortInfoStack.addArrangedSubview(ShortInfoView(frame: CGRect(), model: viewsArray[index]))
            }
        }
    }
    
    private func thisWeekSetup() {
        view.addSubview(thisWeek)
        
        thisWeek.snp.makeConstraints { make in
            make.left.equalTo(Constraints.WeekScreen.ThisWeek.left)
            make.top.equalTo(shortInfoStack.snp.bottom).offset(Constraints.WeekScreen.ThisWeek.top)
        }
    }
    
    private func calendarSetup() {
        view.addSubview(calendar)
        
        calendar.snp.makeConstraints { make in
            make.right.equalTo(Constraints.WeekScreen.Calendar.right)
            make.centerY.equalTo(thisWeek.snp.centerY)
            make.width.height.equalTo(Constraints.WeekScreen.Calendar.side)
        }
    }
    
    private func footerSetup() {
        view.addSubview(footer)
        
        footer.addArrangedSubviews(subViews: [footerImage, footerLabel])
        
        footer.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(Constraints.WeekScreen.Footer.bottom)
        }
    }
    
}

//MARK: TableView setup
extension WeatherWeekScreenVC: UITableViewDataSource, UITableViewDelegate  {
    
    func tableViewSetup() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseID)
        tableView.separatorColor = .clear
        tableView.indicatorStyle = .white
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(thisWeek.snp.bottom).offset(Constraints.WeekScreen.TableView.top)
            make.left.right.equalToSuperview().inset(Constraints.WeekScreen.TableView.sideOffset)
            make.bottom.equalTo(Constraints.WeekScreen.TableView.bottom)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseID) as? TableViewCell else { return UITableViewCell() }
        cell.cloudImage.image = viewsArray[indexPath.row].cloudImage
        cell.starImage.image = viewsArray[indexPath.row].starImage
        cell.temperatureLabel.text = viewsArray[indexPath.row].temperature
        cell.dateLabel.text = viewsArray[indexPath.row].date
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constraints.WeekScreen.TableView.cellHeight
    }
    
    @objc func pop(sender: UITapGestureRecognizer) {
        navigationController?.popViewController(animated: true)
        navigationController?.isNavigationBarHidden = true
    }
    
    
}

class BackButtonView: UIView {
    
    let chevron: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.left")
        imageView.preferredSymbolConfiguration = .init(font: UIFont(name: Fonts.bold, size: 24)!, scale: .small)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Назад"
        label.font = UIFont(name: Fonts.bold, size: FontSizes.MainWeatherScreen.largeSize)
        label.layer.shadowOpacity = 0.1
        label.layer.shadowRadius = 1
        label.layer.shadowOffset = CGSize(width: -2, height: 3)
        label.layer.position = label.center
        label.textColor = .white
        label.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        chevron.isUserInteractionEnabled = true
        label.isUserInteractionEnabled = true
        
        addSubview(chevron)
        addSubview(label)
        
        chevron.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalTo(snp.centerY)
        }
        
        label.snp.makeConstraints { make in
            make.left.equalTo(chevron.snp.right).offset(11)
            make.centerY.equalTo(chevron.snp.centerY).offset(1)
        }
    }
}
