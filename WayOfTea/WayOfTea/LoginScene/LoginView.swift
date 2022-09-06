//
//  LoginView.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 19.04.2022.
//

import UIKit

class LoginView: UIView {
    
    let label = UILabel()
    let passwordTextField = UITextField()
    let mailTextField = UITextField()
    let nextButton = UIButton()
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
        
        mailTextField.layer.masksToBounds = true
        mailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        mailTextField.font = UIFont(name: "CeraPro-Light", size: 24)
        addSubview(mailTextField)
        
        passwordTextField.layer.masksToBounds = true
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        //TODO: Можно ли вводить другим шрифтом?
        passwordTextField.font = UIFont(name: "CeraPro-Light", size: 24)
        passwordTextField.isSecureTextEntry = true
        addSubview(passwordTextField)
        
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
        
        mailTextField.translatesAutoresizingMaskIntoConstraints = false
        mailTextField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 13).isActive = true
        mailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 92).isActive = true
        mailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22).isActive = true
        mailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: mailTextField.bottomAnchor, constant: 4).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 92).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 13).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 47).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 53).isActive = true
        
    }
}
