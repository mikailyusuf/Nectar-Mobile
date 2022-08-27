//
//  CategoryTypeViewController.swift
//  Nectar
//
//  Created by Mikail on 21/08/2022.
//

import UIKit

class CategoryTypeViewController: UIViewController {
    
    let searchController:UISearchController = {
        let results = UIViewController()
        results.view.backgroundColor = .red
        let vc = UISearchController(searchResultsController: HomeSearchTableViewController())
        vc.searchBar.placeholder = "Search Store"
        vc.searchBar.searchBarStyle = .minimal
        vc.definesPresentationContext = true
        return vc
    }()
    
    private let collectionView: UICollectionView =  Utilities().defaultCollection()


    private enum LayoutConstant {
        static let spacing: CGFloat = 16.0
        static let itemHeight: CGFloat = 250.0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Beverages"
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
        setupViews()
        
        collectionView.frame = view.frame
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3"),
                                                            style: .done, target: self, action: #selector(filterIconClicked))
    }
    
    @objc func filterIconClicked(){
        
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        
        
    }
    
    
}


extension CategoryTypeViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = UINavigationController(rootViewController:ProductDetailViewController())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setup(product: Product(name: "Coke", imageUrl: "DFG", productPrice: "1200", unitDescription: "2L, Price"))
        return cell
    }
}


extension CategoryTypeViewController:UICollectionViewDelegateFlowLayout{
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


extension  CategoryTypeViewController:UISearchResultsUpdating, UISearchBarDelegate{
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
