//
//  PasswordView.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 10.04.2022.
//

import Foundation
import UIKit

class PasswordView: UIView{
    
    let label = UILabel()
    let passTextField = UITextField()
    let repPassTextField = UITextField()
    let nextButton = UIButton()
    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        //фон сзади
        backgroundImage.image = UIImage(named: "image-PassView")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        addSubview(backgroundImage)
        
        label.textColor = .black
        label.font = UIFont(name: "CeraPro-Bold", size: 35)
        label.lineBreakMode = .byWordWrapping //чтобы показвал весть текст
        label.numberOfLines = 0 //чтобы показвал весть текст
        addSubview(label)
        
        //passTextField.placeholder = " Пароль"
        passTextField.attributedPlaceholder = NSAttributedString(string: "Пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passTextField.font = UIFont(name: "CeraPro-Light", size: 24)
        passTextField.layer.masksToBounds = true
        passTextField.isSecureTextEntry = true
        addSubview(passTextField)
        
        repPassTextField.layer.masksToBounds = true
        //repPassTextField.placeholder = " Повтори"
        repPassTextField.attributedPlaceholder = NSAttributedString(string: "Повтори", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        repPassTextField.font = UIFont(name: "CeraPro-Light", size: 24)
        repPassTextField.isSecureTextEntry = true
        addSubview(repPassTextField)
        
        nextButton.setTitle("ПРОДОЛЖИТЬ", for: .normal)
        //MARK: Изменить цвет текста на черный
        nextButton.layer.cornerRadius = 30
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.layer.backgroundColor = UIColor(red: 0.745, green: 0.839, blue: 0.737, alpha: 1).cgColor
        nextButton.setTitleColor(UIColor.black, for: .normal)
        nextButton.titleLabel?.font = UIFont(name: "CeraPro-Medium", size: 22)
        addSubview(nextButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: topAnchor, constant: 135).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 47).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22).isActive = true
        label.heightAnchor.constraint(equalToConstant: 158).isActive = true
        
        passTextField.translatesAutoresizingMaskIntoConstraints = false
        passTextField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 4).isActive = true
        passTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 92).isActive = true
        passTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22).isActive = true
        passTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        repPassTextField.translatesAutoresizingMaskIntoConstraints = false
        repPassTextField.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 13).isActive = true
        repPassTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 92).isActive = true
        repPassTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22).isActive = true
        repPassTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.topAnchor.constraint(equalTo: repPassTextField.bottomAnchor, constant: 13).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 47).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 53).isActive = true
    }
}
