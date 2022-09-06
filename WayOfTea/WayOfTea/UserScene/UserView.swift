//
//  UserView.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 20.04.2022.
//

import UIKit

class UserView: UIView {

    let helloLabel = UILabel()
    let signoutButton = UIButton()
    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        backgroundImage.image = UIImage(named: "image-UserView")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        addSubview(backgroundImage)
        
        helloLabel.textColor = .black
        helloLabel.font = UIFont(name: "CeraPro-Bold", size: 35)
        helloLabel.lineBreakMode = .byWordWrapping //чтобы показвал весть текст
        helloLabel.numberOfLines = 0 //чтобы показвал весть текст
        addSubview(helloLabel)
        
        signoutButton.setTitle("выйти".uppercased(), for: .normal)
        //MARK: Изменить цвет текста на черный
        signoutButton.layer.cornerRadius = 30
        signoutButton.translatesAutoresizingMaskIntoConstraints = false
        signoutButton.layer.backgroundColor = UIColor(red: 0.745, green: 0.839, blue: 0.737, alpha: 1).cgColor
        signoutButton.setTitleColor(UIColor.black, for: .normal)
        signoutButton.titleLabel?.font = UIFont(name: "CeraPro-Medium", size: 22)
        addSubview(signoutButton)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        helloLabel.topAnchor.constraint(equalTo: topAnchor, constant: 135).isActive = true
        helloLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 47).isActive = true
        helloLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22).isActive = true
        helloLabel.heightAnchor.constraint(equalToConstant: 158).isActive = true
        
        signoutButton.translatesAutoresizingMaskIntoConstraints = false
        signoutButton.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 13).isActive = true
        signoutButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 47).isActive = true
        signoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22).isActive = true
        signoutButton.heightAnchor.constraint(equalToConstant: 53).isActive = true
        
    }
}
