//
//  CustomButton.swift
//  Neobis_iOS_UIScreens
//
//  Created by G G on 14.04.2023.
//

import Foundation
import UIKit

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
