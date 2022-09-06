//
//  MenuView.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 18.04.2022.
//

import UIKit

class MenuView: UIView {

    let tableView = UITableView()
    let closeButton = UIButton()
    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundImage.image = UIImage(named: "image-Menu")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        addSubview(backgroundImage)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        
        addSubview(tableView)
        
        closeButton.setImage(UIImage(named: "close"), for: .normal)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(closeButton)
        
        makeConstraunt()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeConstraunt() {
        
        closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        tableView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        tableView.trailingAnchor.constraint(equalTo: centerXAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100).isActive = true
    }
    
}
