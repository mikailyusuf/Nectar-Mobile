//
//  CategoryTypeViewController.swift
//  Nectar
//
//  Created by Mikail on 21/08/2022.
//

import UIKit

class CategoryTypeViewController: UIViewController {
    
    var brand:Brand!
    var products:[Product] = []
    private let collectionView: UICollectionView =  Utilities().defaultCollection()

    private enum LayoutConstant {
        static let spacing: CGFloat = 16.0
        static let itemHeight: CGFloat = 250.0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = brand.name
    
        setupViews()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3"),
                    
                                                            style: .done, target: self, action: #selector(filterIconClicked))
        getBrandProducts()
    }
    
    @objc func filterIconClicked(){
        
    }
    
    //MARK: AOPI CALL
   func getBrandProducts(){
       DispatchQueue.global(qos: .background).async {
           BrandApiManager.shared.getBrandProducts(withBrand: self.brand.name) { result in
               switch result{
               case .success(let data):
                   DispatchQueue.main.async {
                       self.collectionView.reloadData()
                       self.products = data
                   }
              
               case .failure(_):
                   print("An error occured getting Brand Products")
               }
           }
       }
      
    }
    
    
    
    private func setupViews() {
        collectionView.frame = view.frame
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        
        
    }
    
    
}


extension CategoryTypeViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = ProductDetailViewController()
        let product = products[indexPath.row]
        vc.product = product
        navigationController?.pushViewController(vc, animated: false)

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

