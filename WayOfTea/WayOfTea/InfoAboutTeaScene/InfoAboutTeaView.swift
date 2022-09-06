//
//  InfoAboutTeaView.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 11.04.2022.
//

import UIKit

class InfoAboutTeaView: UIView {

    let collectionView: UICollectionView
    let label = UILabel()
    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    
    override init(frame: CGRect) {
        
        // configure Here collection view
        let firstCollectionViewLayout = UICollectionViewFlowLayout()
        firstCollectionViewLayout.scrollDirection = .horizontal
        firstCollectionViewLayout.minimumLineSpacing = 33
        firstCollectionViewLayout.itemSize = CGSize(width: 227, height: 407) // cell size
        firstCollectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: firstCollectionViewLayout)
        super.init(frame: frame)

//        label.textColor = .black
//        label.font = UIFont(name: "CeraPro-Bold", size: 35)
//        label.lineBreakMode = .byWordWrapping //чтобы показвал весть текст
//        label.numberOfLines = 0 //чтобы показвал весть текст
//        //MARK: Добавить межстрочный интервал
//        addSubview(label)
    
        backgroundColor = .white
        backgroundImage.image = UIImage(named: "image-TypeOfTea")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        addSubview(backgroundImage)
        
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        //collectionView.layer.borderWidth = 3
        //collectionView.layer.borderColor = UIColor.black.cgColor
        addSubview(collectionView)
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
