//
//  UserViewController.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 20.04.2022.
//

import UIKit
import FirebaseAuth

class UserViewController: UIViewController {
    
    let contentView = UserView()

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.helloLabel.text = "Привет!".uppercased()
        contentView.signoutButton.addTarget(self, action: #selector(didTapSignOut), for: .touchUpInside)
    }

    override func loadView() {
        view = contentView
    }
    
    @objc func moveToRegScene(){
        self.navigationController?.pushViewController(RegViewController(), animated: true)
    }
    @objc func didTapSignOut(){
        //        self.navigationController?.popToRootViewController(animated: true)
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        guard let delegate = self.view.window?.windowScene?.delegate as? SceneDelegate else {return}
        let navController = UINavigationController(rootViewController:RegViewController())
        delegate.window?.rootViewController = navController
        delegate.window?.makeKeyAndVisible()
    }
}
