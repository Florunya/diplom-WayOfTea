//
//  InfoAboutTeaViewController.swift
//  WayOfTea
//
//  Created by Флора Гарифуллина on 11.04.2022.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore

class InfoAboutTeaViewController: UIViewController {
    
    let contentView = InfoAboutTeaView()
//    let viewModel = InfoAboutTeaViewModel()
    let cellReuseIdentifier = "cell"
    var sortedTea = [InfoAboutTeaModel]() // count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(didTapOnMenuButton))
        configureCollectionView()
        InfoAboutTeaViewModel.shared.fetchData { result in
            switch result {
            case .failure(let err):
                print("Error in \(#function): \(err.localizedDescription)")
            case .success(_):
                self.contentView.collectionView.reloadData()
            }
        }
    }
    
    private func configureCollectionView () {
        contentView.collectionView.delegate = self
        contentView.collectionView.dataSource = self
        contentView.collectionView.register(TeaExampleCollectionViewCell.self, forCellWithReuseIdentifier: TeaExampleCollectionViewCell.cellId)
    }
    
   
    //Open menu screen
    @objc func didTapOnMenuButton() {
        let vc = MenusScreenViewController()
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }

    override func loadView() {
        view = contentView
    }

}

extension InfoAboutTeaViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sortedTea.count == 0 ? InfoAboutTeaViewModel.shared.tea.count : sortedTea.count
    }
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
////        let teaName = 
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeaExampleCollectionViewCell.cellId, for: indexPath) as? TeaExampleCollectionViewCell else {fatalError()}
        let data = sortedTea.count == 0 ? InfoAboutTeaViewModel.shared.tea[indexPath.row] : sortedTea[indexPath.row]
        cell.configureInfo(tea: data)
        return cell
    }
    // обработка нажатия на ячейку
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let tea = sortedTea.count == 0 ? InfoAboutTeaViewModel.shared.tea[indexPath.row] : sortedTea[indexPath.row]
        let vc = InfoAboutTeaSortViewController(tea: tea)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension InfoAboutTeaViewController: UICollectionViewDelegateFlowLayout{
    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            return CGSize(width: 110, height: 200)
        }
}

extension InfoAboutTeaViewController: MenusScreenViewControllerDelegate {
    func didChooseTeaSort(sort: DocumentReference, teaName: String) {
        sortedTea.removeAll()
        sortedTea = InfoAboutTeaViewModel.shared.tea.filter({$0.sort == sort})
        contentView.collectionView.reloadData()
        //contentView.somelbl.text = teaName
        self.title = teaName
    }
}
