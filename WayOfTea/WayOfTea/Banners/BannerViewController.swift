//
//  BannerViewController.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 20.04.2022.
//

import UIKit

class BannerViewController: UIViewController {

    //pageController 
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @objc func didTapOnClose() {
        UserDefaults.standard.setValue(true, forKey: "IsUserViewedBanner")
        UserDefaults.standard.synchronize()
        //TODO: make button action
        
//        UserDefaults.standard.removeObject(forKey: "IsUserViewedBanner") //delete object for key
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
