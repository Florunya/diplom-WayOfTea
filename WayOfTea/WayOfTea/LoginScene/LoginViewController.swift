//
//  LoginViewController.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 19.04.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    let contentView = LoginView()
    let viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.label.text = "УКАЖИ СВОЕ\nEMAIL и пароль".uppercased()
        
        contentView.nextButton.addTarget(self, action: #selector(moveToMainScene), for: .touchDown)
        
    }
    
    override func loadView() {
        view = contentView
    }
    @objc func moveToInfoAboutTeaScene(){
        self.navigationController?.pushViewController(InfoAboutTeaViewController(), animated: true)
        guard let delegate = self.view.window?.windowScene?.delegate as? SceneDelegate else {return}
        let tabBarController = configureTabBar()
        delegate.window?.rootViewController = tabBarController
        delegate.window?.makeKeyAndVisible()
    }
    @objc func moveToMainScene(){
        guard let email = contentView.mailTextField.text, email.count > 4 else {
        errorAlert(errorMessage: "Вы ввели некоректный mail")
        return}
        guard let password = contentView.passwordTextField.text, password.count > 0 else {
        errorAlert(errorMessage: "Вы не ввели пароль")
        return}
        viewModel.authUser(email: email, password: password) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(_):
                UserDefaults.standard.set(true, forKey: "IsSignedIn")
                UserDefaults.standard.synchronize()
                self.moveToInfoAboutTeaScene()
            }
        }
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
        let userVC = UINavigationController(rootViewController: UserViewController())
        userVC.tabBarItem.image = UIImage(systemName: "person")
        userVC.tabBarItem.selectedImage = UIImage(systemName: "person")?.withTintColor(UIColor.green)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [infoAboutTeaVC, mapVC, favouritesVC, userVC]
        
        return tabBarController
    }
    
    func errorAlert(errorMessage: String){
        let alert = UIAlertController(title: "Ошибка", message: errorMessage, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Попробуй снова", style: .default){ action in })
        self.present(alert, animated: true, completion: nil)
    }
}
