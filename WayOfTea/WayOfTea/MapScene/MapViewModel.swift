//
//  MapViewModel.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 25.04.2022.
//

import Foundation
import FirebaseFirestore
import CoreLocation

class MapViewModel{
    var points = [ArtworkObject]()
    func fetchData (completion: @escaping (Swift.Result<Bool, RegistrtionError>) -> ()) {

        let fs = Firestore.firestore()
        fs.collection("teahouses").getDocuments { snap, error in
            guard let snap = snap else {
                print("Error while getting Data in \(#function)")
                completion(.failure(.errorWithInternet))
                return
            }
            for doc in snap.documents {
                let data = doc.data()
                guard let name = data["name"] as? String else {return}
                guard let coordinate = data["coordinates"] as? GeoPoint else {return}

                let point = ArtworkObject(title: name, coordinate: CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude))
                self.points.append(point)
            }
            completion(.success(true))
        }
    }
}
