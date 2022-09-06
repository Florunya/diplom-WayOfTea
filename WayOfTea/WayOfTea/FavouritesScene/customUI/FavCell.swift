//
//  FavCell.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 25.04.2022.
//

import UIKit

class FavCell: UITableViewCell {

    var teaImage = UIImageView()
    var teaLabel = UILabel()
    static let cellId = "FavCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(teaImage)
        addSubview(teaLabel)
        
        configureTeaImage()
        configureTeaLabel()
        makeConstaint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureInfo(tea: Favourites){
        do {
//            guard let iconUrl = tea.iconImage else {return} // if let, !, ?? default value
            guard let url = URL(string: tea.icon ?? "") else {return}
            if let data = try? Data(contentsOf: url) {
                teaImage.image = UIImage(data: data)
                teaLabel.text = tea.name
            }else {
                // set default picture
            }

        } catch {
            print(error.localizedDescription)
            //TODO: найти картинку, которая будет ставиться вместо чая, если что-то пойдет по пизде

        }
        
    }

    func configureTeaImage(){
        teaImage.layer.cornerRadius = 10
        teaImage.clipsToBounds = true
        
    }

    func configureTeaLabel(){
        teaLabel.numberOfLines = 0
        teaLabel.adjustsFontSizeToFitWidth = true
        
    }
    private func makeConstaint() {
        
        teaImage.translatesAutoresizingMaskIntoConstraints = false
        teaImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        teaImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        teaImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        teaImage.widthAnchor.constraint(equalTo: teaImage.heightAnchor).isActive = true

        teaLabel.translatesAutoresizingMaskIntoConstraints = false
        teaLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        teaLabel.leadingAnchor.constraint(equalTo: teaImage.trailingAnchor, constant: 20).isActive = true
        teaLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        teaLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
}
