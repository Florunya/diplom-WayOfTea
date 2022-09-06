//
//  CoreDataManager.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 25.04.2022.
//

import Foundation
import CoreData

enum CoreDataErrors: Error {
    case defaultError
}

final class CoreDataManager {
    static let shared = CoreDataManager()
    private init () {}
    
    let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FavModel")
        container.loadPersistentStores { desc, error in
            if let error = error {
                fatalError("Unable to initialize container \(#function)")
            }
        }
        return container
    }()
    
    public func loadData(completion: @escaping (Swift.Result<[Favourites], CoreDataErrors>) -> ()) {
        let context = container.viewContext
        var _result = [Favourites]()
        context.performAndWait {
            let request = NSFetchRequest<Favourites>(entityName: "Favourites")
            do {
                let result = try request.execute()
                _result = result
            } catch {
                completion(.failure(.defaultError))
            }
        }
        try? context.save()
        completion(.success(_result))
    }
    
    public func writeData(name: String, icon: String, teaDescr: String, completion: @escaping (Swift.Result<String, CoreDataErrors>) -> ()) {
        let writeContext = container.newBackgroundContext()
        writeContext.performAndWait {
            let fav = Favourites(context: writeContext)
            fav.icon = icon
            fav.name = name
            fav.teaDescr = teaDescr
            do {
                try writeContext.save()
                print("Data Saved")
                completion(.success("Data Saved"))
            } catch {
                print(error.localizedDescription)
                completion(.failure(.defaultError))
            }
        }
    }
    //TODO: засунуть этот метод куда-то
    public func deleteData(fav: Favourites, completion: @escaping (Swift.Result<String, CoreDataErrors>) -> Void) {
        do {
            container.viewContext.delete(fav)
            try container.viewContext.save()
            completion(.success("Data Deleted"))
        } catch {
            print(error.localizedDescription)
            completion(.failure(.defaultError))
        }
    }
    
    public func isInDataBase(name: String) -> Bool {
        var res: Bool = false
        loadData { result in
            switch result{
            case .success(let favs):
                let resCount = favs.filter({$0.name == name})
                res = resCount.count > 0 ? true : false
            case .failure(_):
                res = false
            }
        }
        return res
    }
}
