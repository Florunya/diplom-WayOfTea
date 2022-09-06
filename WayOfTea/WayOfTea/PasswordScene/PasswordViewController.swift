//
//  PasswordViewController.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 10.04.2022.
//

import Foundation
import UIKit

class PasswordViewController: UIViewController, UITextFieldDelegate{
    
    let contentView = PasswordView()
    let viewModel = PasswordViewModel()
    let mail: String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.label.text = "придумай\nпароль".uppercased()
        contentView.nextButton.addTarget(self, action: #selector(moveToMainScene), for: .touchUpInside)
        
    }
    init(mail: String){
        self.mail = mail
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func moveToMainScene(){
        //TODO: name allert
        guard let password = contentView.passTextField.text, password.count > 0 else {
            errorAlert(errorMessage: "Поле с паролем пусто")
            return}
        guard let repPassword = contentView.repPassTextField.text, repPassword.count > 0 && contentView.repPassTextField.text == contentView.passTextField.text else{
            errorAlert(errorMessage: "Пароли не совпадают")
            return}
        viewModel.registerUser(email: self.mail, name: "", password: password) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(_):
                self.moveToMainScreen()
            }
        }
    }
    
    func moveToMainScreen() {
        print(#function)
        guard let delegate = self.view.window?.windowScene?.delegate as? SceneDelegate else {return}
        let tabBarController = configureTabBar()
        delegate.window?.rootViewController = tabBarController
        delegate.window?.makeKeyAndVisible()
    }
//    MARK: TabBar initiolization
    func configureTabBar() -> UIViewController{
        let infoAboutTeaVC = UINavigationController(rootViewController: InfoAboutTeaViewController())
        infoAboutTeaVC.tabBarItem.image = UIImage(systemName: "leaf")
        infoAboutTeaVC.tabBarItem.selectedImage = UIImage(systemName: "leaf")?.withTintColor(UIColor.green)
        let mapVC = UINavigationController(rootViewController: MapViewController())
        mapVC.tabBarItem.image = UIImage(systemName: "map")
        let favouritesVC = UINavigationController(rootViewController: FavouritesViewController())
        favouritesVC.tabBarItem.image = UIImage(systemName: "heart")
        let tabBarController = UITabBarController()
        let userVC = UINavigationController(rootViewController: UserViewController())
        userVC.tabBarItem.image = UIImage(named: "person")
        userVC.tabBarItem.selectedImage = UIImage(named: "person")?.withTintColor(UIColor.green)
        
        tabBarController.viewControllers = [infoAboutTeaVC, mapVC, favouritesVC, userVC]
        
        return tabBarController
    }
    
    override func loadView() {
        print(#function)
        view = contentView
    }
    
    func errorAlert(errorMessage: String){
        let alert = UIAlertController(title: "Ошибка", message: errorMessage, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Попробовать снова", style: .default){ action in })
        self.present(alert, animated: true, completion: nil)
    }
    
}

