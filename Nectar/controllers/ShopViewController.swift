//
//  ShopViewController.swift
//  Nectar
//
//  Created by Mikail on 23/07/2022.
//

import UIKit
import SwiftUI

enum SectionTypes{
    case latest
    case bestSelling
    case electronics
    
    var title:String{
        switch self {
        case .latest:
            return "Latest"
        case .bestSelling:
            return "Best Selling"
        case .electronics:
            return "Electronics"
        }
    }
}

class ShopViewController: UIViewController,UISearchResultsUpdating, UISearchBarDelegate {
  
    var sections = [SectionTypes]()
        
    private var collectionView:UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout{sectionIndex,_ -> NSCollectionLayoutSection? in return ShopViewController.createSectionLayout(section: sectionIndex)})
    
    private var latest:[Product] = []
    private var bestSelling:[Product] = []
    private var electronics:[Product] = []
    

    let searchController:UISearchController = {
       let results = UIViewController()
        results.view.backgroundColor = .red
        let vc = UISearchController(searchResultsController: HomeSearchTableViewController())
        vc.searchBar.placeholder = "Rice,Beans"
        vc.searchBar.searchBarStyle = .minimal
        vc.definesPresentationContext = true
        return vc
    }()
    



    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
        configureCollectionView()
        getProducts()
    }
      
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    private func configureCollectionView(){
        view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(ProductCollectionViewCell.self,forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        collectionView.register(HeaderLayoutItem.self,forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderLayoutItem.reuseIdentifier)
        collectionView.dataSource  = self
        collectionView.delegate = self
            
        sections.append(.latest)
        sections.append(.bestSelling)
        sections.append(.electronics)
        
      
    }
    
    
    //MARK: API
    func getProducts(){
        DispatchQueue.main.async {
            ProductApiManager.shared.getProducts { result in
                switch result{
                    
                case .success(let model):
                    self.latest = model.latest
                    self.bestSelling = model.best_selling
                    self.electronics = model.electronics
                   
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                case .failure(_):
                 
                    print("Error in getting products")
                }
            }
        }
      
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        print("Item search is \(searchBar.text)")
    }

    func updateSearchResults(for searchController: UISearchController) {
//        print("Item search is \(searchController.searchBar.text)")
    }
    
    
    private static func createSectionLayout(section:Int)->NSCollectionLayoutSection{
      
        let supplementaryView = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)),elementKind: UICollectionView.elementKindSectionHeader,alignment: .top)
        ]
        
        switch section{
            
        case 0:
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1.0)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(250)), subitem: item,count: 2)
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            section.boundarySupplementaryItems = supplementaryView
            return section
            
        case 1:
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8)
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(250)), subitem: item,count: 2)
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            section.boundarySupplementaryItems = supplementaryView
            return section
        case 2:
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8)
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(250)), subitem: item,count: 2)
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            section.boundarySupplementaryItems = supplementaryView
            return section
            
        default:
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0 )))
            
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            //Verical group
            let vericalgroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(390)), subitem: item,count: 1)
            
            
            //section
            let section =  NSCollectionLayoutSection(group: vericalgroup)
            return section
        }
    }
    
}


extension ShopViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let type = sections[section]
        switch type{
        case .latest:
            return latest.count
            
        case .bestSelling:
            return bestSelling.count
        case .electronics:
            return electronics.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        var product:Product!
        switch indexPath.section{
        case 0:
            product = latest[indexPath.row]
        case 1:
            product = bestSelling[indexPath.row]
        case 2:
            product = electronics[indexPath.row]
        default:
            print("nothing")
        }
        let vc = ProductDetailViewController()
        vc.product = product
        navigationController?.pushViewController(vc, animated: false)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderLayoutItem.reuseIdentifier, for: indexPath) as? HeaderLayoutItem else{
            return UICollectionReusableView()
        }
        
        let section = indexPath.section
        let title = sections[section].title
        header.setup(headerName: title)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let type = sections[indexPath.section]
        switch type{
        case .latest:
         
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell else {
                return UICollectionViewCell()
            }
            let item = latest[indexPath.row]
            cell.setup(product: item)
            return cell
            
        case .bestSelling:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell else {
                return UICollectionViewCell()
            }
            let item = bestSelling[indexPath.row]
            cell.setup(product: item)

            return cell
        case .electronics:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell else {
                return UICollectionViewCell()
            }
            let item = electronics[indexPath.row]
            cell.setup(product: item)
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    
}

