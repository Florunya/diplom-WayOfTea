//
//  MenuModelView.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 20.04.2022.
//

import Foundation
import FirebaseFirestore

class MenuViewModel {
    private init () {}
    static let shared = MenuViewModel()
    var collectionArray = [MenuModel]()
    
    func fetchData (completion: @escaping (Swift.Result<Bool, RegistrtionError>) -> ()) {
        collectionArray.removeAll()
        let fs = Firestore.firestore()
        fs.collection("Collections").getDocuments { snap, error in
            guard let snap = snap else {
                print("Error while getting Data in \(#function)")
                completion(.failure(.errorWithInternet))
                return
            }
            for doc in snap.documents {
                let data = doc.data()
                guard let name = data["name"] as? String else {return}
                guard let pr = data["priority"] as? Int else {return}
                let referece = doc.reference
                let model = MenuModel(name: name, priority: pr, reference: referece)
                self.collectionArray.append(model)
            }
            completion(.success(true))
        }
    }
}
