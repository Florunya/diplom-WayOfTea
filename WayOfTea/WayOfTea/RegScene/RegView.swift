//
//  RegView.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 10.04.2022.
//

import Foundation
import UIKit

class RegView: UIView {
    
    let label = UILabel()
    let nameTextField = UITextField()
    let mailTextField = UITextField()
    let nextButton = UIButton()
    let loginButton = UIButton()
    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        //фон сзади
        backgroundImage.image = UIImage(named: "image-firstView")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        addSubview(backgroundImage)
        
        label.textColor = .black
        label.font = UIFont(name: "CeraPro-Bold", size: 35)
        label.lineBreakMode = .byWordWrapping //чтобы показвал весть текст
        label.numberOfLines = 0 //чтобы показвал весть текст
        //MARK: Добавить межстрочный интервал
        addSubview(label)
        
        //nameTextField.layer.borderWidth = 1
        //nameTextField.layer.borderColor = UIColor.systemGray.cgColor
        nameTextField.layer.masksToBounds = true
        //nameTextField.layer.cornerRadius = 15
        //nameTextField.placeholder = "  Имя"
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Имя", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        //MARK: Можно ли вводить другим шрифтом?
        nameTextField.font = UIFont(name: "CeraPro-Light", size: 24)
        addSubview(nameTextField)
        
        //mailTextField.layer.borderWidth = 1
        //mailTextField.layer.borderColor = UIColor.systemGray.cgColor
        mailTextField.layer.masksToBounds = true
        //mailTextField.layer.cornerRadius = 15
        //mailTextField.placeholder = "  Email"
        mailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        mailTextField.font = UIFont(name: "CeraPro-Light", size: 24)
        addSubview(mailTextField)
        
        nextButton.setTitle("ПРОДОЛЖИТЬ", for: .normal)
        //MARK: Изменить цвет текста на черный
        nextButton.layer.cornerRadius = 30
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.layer.backgroundColor = UIColor(red: 0.745, green: 0.839, blue: 0.737, alpha: 1).cgColor
        nextButton.setTitleColor(UIColor.black, for: .normal)
        nextButton.titleLabel?.font = UIFont(name: "CeraPro-Medium", size: 22)
        addSubview(nextButton)
        
        loginButton.setTitle("Уже зарегестрированны? Войдите", for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitleColor(UIColor.black, for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "CeraPro-Medium", size: 16)
        addSubview(loginButton)
        
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
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 4).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 92).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        mailTextField.translatesAutoresizingMaskIntoConstraints = false
        mailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 13).isActive = true
        mailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 92).isActive = true
        mailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22).isActive = true
        mailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.topAnchor.constraint(equalTo: mailTextField.bottomAnchor, constant: 13).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 47).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 53).isActive = true
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 10).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 47).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

