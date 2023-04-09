//
//  TableViewCell.swift
//  Neobis_iOS_UIScreens
//
//  Created by G G on 08.04.2023.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
    static let reuseID = "TableViewCell"
    
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
        label.font = UIFont(name: Fonts.regular, size: Sizes.MainWeatherScreen.Default.fontSize)
        label.layer.shadowOpacity = 0.1
        label.layer.shadowRadius = 1
        label.layer.shadowOffset = CGSize(width: -2, height: 3)
        label.layer.position = label.center
        label.textColor = .white
        label.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.regular, size: Sizes.MainWeatherScreen.Default.fontSize)
        label.layer.shadowOpacity = 0.1
        label.layer.shadowRadius = 1
        label.layer.shadowOffset = CGSize(width: -2, height: 3)
        label.layer.position = label.center
        label.textColor = .white
        label.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: TableViewCell.reuseID)
        backgroundColor = .clear
        dateSetup()
        cloudSetup()
        tempSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func dateSetup() {
        addSubview(dateLabel)
        
        dateLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalTo(snp.centerY)
        }
    }
    
    private func cloudSetup() {
        addSubview(cloudImage)
        
        cloudImage.snp.makeConstraints { make in
            make.centerX.equalTo(snp.centerX)
            make.centerY.equalTo(snp.centerY)
        }
    }
    
    private func tempSetup() {
        addSubview(temperatureLabel)
        
        temperatureLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(40)
            make.centerY.equalTo(snp.centerY)
        }
    }
}
