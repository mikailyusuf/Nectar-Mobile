//
//  ExploreViewController.swift
//  Nectar
//
//  Created by Mikail on 23/07/2022.
//

import UIKit


class ExploreViewController: UIViewController{
    
//    let searchController:UISearchController = {
//        let results = UIViewController()
//        results.view.backgroundColor = .red
//        let vc = UISearchController(searchResultsController: SearchTableViewController())
//        vc.searchBar.placeholder = "Search Store"
//        vc.searchBar.searchBarStyle = .minimal
//        vc.definesPresentationContext = true
//        return vc
//    }()
    
//    private let collectionView: UICollectionView = {
//        let viewLayout = UICollectionViewFlowLayout()
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
//        collectionView.backgroundColor = .white
//        return collectionView
//    }()
    
    private let collectionView: UICollectionView =  Utilities().defaultCollection()
    
    private enum LayoutConstant {
        static let spacing: CGFloat = 16.0
        static let itemHeight: CGFloat = 160.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
//        searchController.searchResultsUpdater = self
//        searchController.searchBar.delegate = self
//        navigationItem.searchController = searchController
        
        setupViews()
        
        collectionView.frame = view.frame
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(collectionView)

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
    
  
    
    
}

extension ExploreViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = CategoryTypeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setup(name: "Meat")
        return cell
    }
}

extension ExploreViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = itemWidth(for: view.frame.width, spacing: LayoutConstant.spacing)

           return CGSize(width: width, height: LayoutConstant.itemHeight)
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: LayoutConstant.spacing, left: LayoutConstant.spacing, bottom: LayoutConstant.spacing, right: LayoutConstant.spacing)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }

       func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
           let itemsInRow: CGFloat = 2

           let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
           let finalWidth = (width - totalSpacing) / itemsInRow

           return finalWidth - 5.0
       }
}

//
//extension ExploreViewController:UISearchResultsUpdating, UISearchBarDelegate{
//    func updateSearchResults(for searchController: UISearchController) {
//
//    }
//}
