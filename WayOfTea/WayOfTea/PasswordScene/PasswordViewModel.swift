//
//  PasswordViewModel.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 20.04.2022.
//

import Foundation
import FirebaseAuth

enum RegistrtionError: Error {
    case invalidData
    case errorWithInternet
}

//async await
// promise
// completion with Swift.Result
class PasswordViewModel{
    
    func registerUser(email: String, name: String, password: String, completion: @escaping (Swift.Result<Bool, RegistrtionError>) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Method \(#function) fail with error \(error.localizedDescription)")
                completion(.failure(.errorWithInternet))
            }
            if let _ = result {
                print("Method \(#function) has succesfully registered user")
                completion(.success(true))
            }
        }
    }
    
}
