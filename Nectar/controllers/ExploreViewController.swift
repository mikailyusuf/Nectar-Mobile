//
//  ExploreViewController.swift
//  Nectar
//
//  Created by Mikail on 23/07/2022.
//

import UIKit


class ExploreViewController: UIViewController{
    
    private let collectionView: UICollectionView =  Utilities().defaultCollection()
    
    var brands:[Brand] = []

    private enum LayoutConstant {
        static let spacing: CGFloat = 16.0
        static let itemHeight: CGFloat = 160.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        
        setupViews()
        collectionView.frame = view.frame
        getBrands()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(collectionView)

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
    
    private func getBrands(){
        BrandApiManager.shared.getBrands { result in
            switch result{
            case .success(let data):
                DispatchQueue.main.async {
                
                    self.brands = data
                    self.collectionView.reloadData()
                }
              
            case .failure(_):
                print("An error occured")
            }
        }
    }
}



extension ExploreViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        brands.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = CategoryTypeViewController()
        vc.brand = brands[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let brand = brands[indexPath.row]
        cell.setup(brand: brand)
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
