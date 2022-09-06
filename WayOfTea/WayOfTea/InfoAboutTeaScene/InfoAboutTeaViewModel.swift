//
//  InfoAboutTeaViewModel.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 22.04.2022.
//

import Foundation
import FirebaseFirestore
import CloudKit

class InfoAboutTeaViewModel {
    var tea = [InfoAboutTeaModel]()
    private init () {}
    static let shared = InfoAboutTeaViewModel()
    
    func fetchData (completion: @escaping (Swift.Result<Bool, RegistrtionError>) -> ()) {
        let fs = Firestore.firestore()
        fs.collection("tea").getDocuments { snap, error in
            guard let snap = snap else {
                print("Error while getting Data in \(#function)")
                completion(.failure(.errorWithInternet))
                return
            }
            for doc in snap.documents {
                let data = doc.data()
                guard let name = data["name"] as? String else {return}
                guard let description = data["description"] as? String else {return}
                guard let iconImage = data["iconImage"] as? String else {return}
                guard let sortReference = data["sort"] as? DocumentReference else {return}
                guard let brewingTime = data["brewingTime"] as? String? else {return}
                guard let brewingTemp = data["brewingTemp"] as? String? else {return}
                let type = data["type"] as? String
                let _tea = InfoAboutTeaModel(name: name, sort: sortReference, type: type, description: description, iconImage: iconImage, brewingTime: brewingTime, brewingTemp: brewingTemp)
                self.tea.append(_tea)
            }
            completion(.success(true))
        }
    }
}
