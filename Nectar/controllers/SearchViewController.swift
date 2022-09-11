//
//  HomeSearchTableViewController.swift
//  Nectar
//
//  Created by Mikail on 20/08/2022.
//

import UIKit

class SearchViewController: UIViewController {

    var items = [String] ()
    
    var products:[Product] = []
     let CELLID = "CELLID"
    
    private let collectionView: UICollectionView =  Utilities().defaultCollection()
    
    private enum LayoutConstant {
        static let spacing: CGFloat = 16.0
        static let itemHeight: CGFloat = 250.0
    }
    
     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = .systemBackground
         setupViews()
         
         collectionView.frame = view.frame
     }
     
     private func setupViews() {
         view.backgroundColor = .white
         view.addSubview(collectionView)

         collectionView.dataSource = self
         collectionView.delegate = self
         collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
     }


    
    func update(with product:[Product]){
        DispatchQueue.main.async {
            self.products = product
            self.collectionView.reloadData()
        }
        
    }
}


extension SearchViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
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
        
        let product = products[indexPath.row]
        cell.setup(product: product)
        return cell
    }
}


extension SearchViewController:UICollectionViewDelegateFlowLayout{
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
