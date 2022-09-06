//
//  InfoAboutTeaModel.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 16.04.2022.
//

import Foundation
import FirebaseFirestore

class InfoAboutTeaModel {
    
    let name: String?
    let sort: DocumentReference
    let type: String?
    let description: String?
    let iconImage: String?
    let brewingTime: String?
    let brewingTemp: String?
    
    
    init(name: String?, sort: DocumentReference, type: String?, description: String?, iconImage: String?, brewingTime: String?, brewingTemp: String?) {
        self.name = name
        self.sort = sort
        self.type = type
        self.description = description
        self.iconImage = iconImage
        self.brewingTime = brewingTime
        self.brewingTemp = brewingTemp
    }
}

// class - reference type
// struct - value type
