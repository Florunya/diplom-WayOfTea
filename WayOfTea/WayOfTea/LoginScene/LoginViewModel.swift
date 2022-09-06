//
//  LoginViewModel.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 19.04.2022.
//

import Foundation
import FirebaseAuth

enum LoginError: Error {
    case invalidData
    case errorWithInternet
}
class LoginViewModel{
    
    func authUser(email: String, password: String, completion: @escaping (Swift.Result<Bool, RegistrtionError>) -> ()){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
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
