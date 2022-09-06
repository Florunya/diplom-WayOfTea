//
//  MenuModel.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 20.04.2022.
//

import Foundation
import FirebaseFirestore

public class MenuModel {
    let name: String
    let priority: Int
    let reference: DocumentReference
    init(name: String, priority: Int, reference: DocumentReference) {
        self.name = name
        self.priority = priority
        self.reference = reference
    }
}
