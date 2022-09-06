//
//  FavouritesViewController.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 11.04.2022.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore

class FavouritesViewController: UIViewController {
    
    let contentView = FavouritesView()
    var favs = [Favourites]()
    
    let reuseidentifier = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    // leading data from coredata
    func loadData() {
        CoreDataManager.shared.loadData { result in
            switch result{
            case .failure(let err):
                print(err)
            case .success(let favs):
                self.favs = favs
                self.contentView.tableView.reloadData()
            }
        }
    }
    
    override func loadView() {
        view = contentView
    }
    func configureTableView(){
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        contentView.tableView.register(FavCell.self, forCellReuseIdentifier: FavCell.cellId)
    }

}
extension FavouritesViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavCell.cellId, for: indexPath) as? FavCell else {fatalError()}
        let data = self.favs[indexPath.row]
        cell.selectionStyle = .none
        cell.configureInfo(tea: data)
        return cell
    }
    // найти метод который обрабатывает свайпы у таблицы
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let fav = favs[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { [self]  _, _, complete in
            CoreDataManager.shared.deleteData(fav: fav) { result in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(_):
                    print("Success")
                }
            }
            favs.remove(at: indexPath.row)
            tableView.reloadData()
            complete(true)
        }
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])
        swipeActions.performsFirstActionWithFullSwipe = true
        return swipeActions
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Избранное"
//    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let tea = InfoAboutTeaViewModel.shared.tea.filter({$0.name == self.favs[indexPath.row].name})
        guard let _tea = tea.first else {return}
        let vc = InfoAboutTeaSortViewController(tea: _tea)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
