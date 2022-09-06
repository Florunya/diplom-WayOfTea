//
//  TeaExampleCollectionViewCell.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 22.04.2022.
//

import UIKit
import FirebaseFirestore

class TeaExampleCollectionViewCell: UICollectionViewCell {
    
    static let cellId = "TeaExampleCollectionViewCell"
    
    let circleBgView = UIView()
    let teaImage = UIImageView()
    let favButton = UIButton()
    let teaName = UILabel()
    var shadows = UIView()
    var tea: InfoAboutTeaModel?
    var isInFav: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 113.5
        
        backgroundColor = UIColor(red: 0.314, green: 0.522, blue: 0.545, alpha: 1)
        
        circleBgView.backgroundColor = UIColor(red: 122/255, green: 162/255, blue: 166/255, alpha: 1)
        circleBgView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(circleBgView)
        
        teaImage.image = UIImage(named: "user")!
        teaImage.translatesAutoresizingMaskIntoConstraints = false
        teaImage.contentMode = .scaleAspectFill
        teaImage.clipsToBounds = true
        circleBgView.addSubview(teaImage)
        
        teaName.text = "TEA"
        teaName.font = UIFont(name: "CeraPro-Medium", size: 20)
        teaName.lineBreakMode = .byWordWrapping
        teaName.numberOfLines = 0
        teaName.textAlignment = .center
        teaName.textColor = .white
        teaName.translatesAutoresizingMaskIntoConstraints = false
        addSubview(teaName)
        
        favButton.setImage(UIImage(named: "FavButton"), for: .normal)
        favButton.translatesAutoresizingMaskIntoConstraints = false
        favButton.addTarget(self, action: #selector(addToFav), for: .touchUpInside)
        addSubview(favButton)
        
        makeConstaint()
    }
    
    @objc private func addToFav() {
        if isInFav{
            isInFav.toggle()
            let _tea = Favourites()
            _tea.name = tea?.name
            _tea.icon = tea?.iconImage
            _tea.teaDescr = tea?.description
            CoreDataManager.shared.deleteData(fav: _tea) { result in
                switch result {
                case .failure(_):
                    print("fail")
                case .success(_):
                    self.favButton.setImage(UIImage(named: "FavButton")!, for: .normal)
                }
            }
        } else {
            isInFav.toggle()
            CoreDataManager.shared.writeData(name: tea?.name ?? "", icon: tea?.iconImage ?? "", teaDescr: tea?.description ?? "") { result in
                switch result{
                case .success(_):
                    print("Data Added")
                    // change button image
                    self.favButton.setImage(UIImage(named: "likedButtonImage")!, for: .normal)
                case .failure(_):
                    print("error while addind Data")
                }
            }
        }
    }
    
    public func configureInfo(tea: InfoAboutTeaModel){
        self.tea = tea
        do {
//            guard let iconUrl = tea.iconImage else {return} // if let, !, ?? default value
            guard let url = URL(string: tea.iconImage ?? "") else {return}
            let data = try Data(contentsOf: url)
            teaImage.image = UIImage(data: data)
            teaName.text = tea.name
//            {
//                teaImage.image = UIImage(data: data)
//                teaName.text = tea.name
//            }else {
//                // set default picture
//            }

        } catch {
            print(error.localizedDescription)
            //TODO: найти картинку, которая будет ставиться вместо чая, если что-то пойдет по пизде

        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func makeConstaint() {
        
        circleBgView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        circleBgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        circleBgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        circleBgView.heightAnchor.constraint(equalToConstant: 187).isActive = true
        circleBgView.layer.cornerRadius = 93.5
        
        teaImage.topAnchor.constraint(equalTo: circleBgView.topAnchor, constant: 8).isActive = true
        teaImage.leadingAnchor.constraint(equalTo: circleBgView.leadingAnchor, constant: 8).isActive = true
        teaImage.trailingAnchor.constraint(equalTo: circleBgView.trailingAnchor, constant: -8).isActive = true
        teaImage.heightAnchor.constraint(equalToConstant: 187).isActive = true
//        teaImage.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -4).isActive = true

        teaName.topAnchor.constraint(equalTo: teaImage.bottomAnchor, constant: 30).isActive = true
        teaName.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        teaName.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        teaName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        favButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        favButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10).isActive = true
        favButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        favButton.heightAnchor.constraint(equalToConstant: 90).isActive = true
    }
    
}
