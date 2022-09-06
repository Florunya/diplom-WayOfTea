//
//  RegViewController.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 10.04.2022.
//

import UIKit
import Firebase

class RegViewController: UIViewController {

    let contentView = RegView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.label.text = "ДАВАЙ НАЧНЕМ!\nУКАЖИ СВОЕ\nИМЯ И EMAIL".uppercased()
        contentView.nextButton.addTarget(self, action: #selector(moveToPasswordScene), for: .touchDown)
        contentView.loginButton.addTarget(self, action: #selector(moveToLoginScene), for: .touchDown)
    }
    
    //MARK: move to pass scene
    @objc func moveToPasswordScene(){
        //TODO: Add email check
        guard let mail = contentView.mailTextField.text, mail.count > 4 else {
            errorAlert(errorMessage: "Вы ввели некоректный mail")
            return
        }
        self.navigationController?.pushViewController(PasswordViewController(mail: mail), animated: true)
    }
    @objc func moveToLoginScene(){
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
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
