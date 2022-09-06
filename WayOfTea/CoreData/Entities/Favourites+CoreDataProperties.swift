//
//  Favourites+CoreDataProperties.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 25.04.2022.
//
//

import Foundation
import CoreData


extension Favourites {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favourites> {
        return NSFetchRequest<Favourites>(entityName: "Favourites")
    }

    @NSManaged public var name: String?
    @NSManaged public var icon: String?
    @NSManaged public var teaDescr: String?
    

}

extension Favourites : Identifiable {

}
