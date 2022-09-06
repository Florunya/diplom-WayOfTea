//
//  InvoAboutTeaSortView.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 22.04.2022.
//

import UIKit

class InvoAboutTeaSortView: UIView {
    
    let teaSortNameLabel = UILabel()
    let teaSortImage = UIImageView()
    let teaSortDescriptionLabel = UILabel()
    let layerImage = CALayer()
    let teaBrewingTimeLabel = UILabel()
    let teaBrewingTempLabel = UILabel()
    let teaBrewingTimeLabelFromFB = UILabel()
    let teaBrewingTempLabelFromFB = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
                
        teaSortNameLabel.textColor = .black
        teaSortNameLabel.font = UIFont(name: "CeraPro-Bold", size: 35)
        teaSortNameLabel.lineBreakMode = .byWordWrapping //чтобы показвал весть текст
        teaSortNameLabel.numberOfLines = 0 //чтобы показвал весть текст
        //MARK: Добавить межстрочный интервал
        addSubview(teaSortNameLabel)
        
        teaBrewingTimeLabel.textColor = UIColor(red: 0.358, green: 0.354, blue: 0.354, alpha: 1)
        teaBrewingTimeLabel.font = UIFont(name: "CeraPro-Regular", size: 15)
        teaBrewingTimeLabel.lineBreakMode = .byWordWrapping //чтобы показвал весть текст
        teaBrewingTimeLabel.numberOfLines = 0 //чтобы показвал весть текст
        teaBrewingTimeLabel.textAlignment = .justified
        //MARK: Добавить межстрочный интервал
        addSubview(teaBrewingTimeLabel)
        
        teaBrewingTempLabel.textColor = UIColor(red: 0.358, green: 0.354, blue: 0.354, alpha: 1)
        teaBrewingTempLabel.font = UIFont(name: "CeraPro-Regular", size: 15)
        teaBrewingTempLabel.lineBreakMode = .byWordWrapping //чтобы показвал весть текст
        teaBrewingTempLabel.numberOfLines = 0 //чтобы показвал весть текст
        teaBrewingTempLabel.textAlignment = .justified
        //MARK: Добавить межстрочный интервал
        addSubview(teaBrewingTempLabel)
        
        teaSortImage.contentMode = .scaleAspectFill
        teaSortImage.clipsToBounds = true
        addSubview(teaSortImage)
        
        teaSortDescriptionLabel.textColor = UIColor(red: 0.314, green: 0.522, blue: 0.545, alpha: 1)
        teaSortDescriptionLabel.font = UIFont(name: "CeraPro-Bold", size: 15)
        teaSortDescriptionLabel.lineBreakMode = .byWordWrapping
        teaSortDescriptionLabel.numberOfLines = 0
        teaSortDescriptionLabel.textAlignment = .justified
        addSubview(teaSortDescriptionLabel)
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureData(tea: InfoAboutTeaModel) {
        if let url = URL(string: tea.iconImage ?? "") {
            if let img = try? Data(contentsOf: url) {
                teaSortImage.image = UIImage(data: img)
            } else {
              // set default image
            }
            
        } else {
            // set default image
        }
        
        teaSortNameLabel.text = tea.name
        teaSortDescriptionLabel.text = tea.description
        teaBrewingTimeLabel.text = "Время заваривания: \(tea.brewingTime ?? "2-3") сек"
        teaBrewingTempLabel.text = "Температура заваривания: \(tea.brewingTemp ?? "100") градусов"
    }
    
    private func makeConstraints() {
        
        teaSortNameLabel.translatesAutoresizingMaskIntoConstraints = false
        teaSortNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 95).isActive = true
        teaSortNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        teaSortNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -44).isActive = true
        teaSortNameLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true

        teaBrewingTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        teaBrewingTimeLabel.topAnchor.constraint(equalTo: teaSortNameLabel.bottomAnchor, constant: 40).isActive = true
        teaBrewingTimeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        teaBrewingTimeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -44).isActive = true
        teaBrewingTimeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        teaBrewingTempLabel.translatesAutoresizingMaskIntoConstraints = false
        teaBrewingTempLabel.topAnchor.constraint(equalTo: teaBrewingTimeLabel.bottomAnchor, constant: 8).isActive = true
        teaBrewingTempLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        teaBrewingTempLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        teaBrewingTempLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        teaSortImage.translatesAutoresizingMaskIntoConstraints = false
        teaSortImage.topAnchor.constraint(equalTo: teaBrewingTempLabel.bottomAnchor, constant: 24).isActive = true
        teaSortImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        teaSortImage.widthAnchor.constraint(equalToConstant: 246).isActive = true
        teaSortImage.heightAnchor.constraint(equalToConstant: 246).isActive = true

        teaSortDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        teaSortDescriptionLabel.topAnchor.constraint(equalTo: teaSortImage.bottomAnchor, constant: 24).isActive = true
        teaSortDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        teaSortDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -44).isActive = true
        teaSortDescriptionLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
