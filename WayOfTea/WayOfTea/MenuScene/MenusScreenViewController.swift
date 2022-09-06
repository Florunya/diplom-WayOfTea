//
//  MenusScreenViewController.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 18.04.2022.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore

protocol MenusScreenViewControllerDelegate {
    func didChooseTeaSort(sort: DocumentReference, teaName: String)
}

class MenusScreenViewController: UIViewController {
    
    let contentView = MenuView()
    let sortOfTea = MenuViewModel.shared.collectionArray
    let cellReuseIdentifier = "cell"
    var delegate: MenusScreenViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        contentView.closeButton.addTarget(self, action: #selector(closeInfoAboutTea), for: .touchDown)
        MenuViewModel.shared.fetchData{ result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(_):
                self.contentView.tableView.reloadData()
            }
        }
    }

    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    func configureTableView(){
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        contentView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
    }
    @objc func closeInfoAboutTea(){
        print(#function)
        dismiss(animated: true)
    }
}

extension MenusScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuViewModel.shared.collectionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        cell.textLabel?.text = MenuViewModel.shared.collectionArray[indexPath.row].name
        cell.backgroundColor = UIColor.clear
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedSorts = MenuViewModel.shared.collectionArray[indexPath.row]
        delegate?.didChooseTeaSort(sort: selectedSorts.reference, teaName: selectedSorts.name)
        dismiss(animated: true, completion: nil)
    }
}
