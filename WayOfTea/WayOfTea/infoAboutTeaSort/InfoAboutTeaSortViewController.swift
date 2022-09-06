//
//  InfoAboutTeaSortViewController.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 22.04.2022.
//

import UIKit

class InfoAboutTeaSortViewController: UIViewController {

    let contentView = InvoAboutTeaSortView()
    let infoAboutTea: InfoAboutTeaModel

    init (tea: InfoAboutTeaModel){
        self.infoAboutTea = tea
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.configureData(tea: self.infoAboutTea)
    }
    
    override func loadView() {
        view = contentView
    }

}
