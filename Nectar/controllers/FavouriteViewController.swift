//
//  FavouriteViewController.swift
//  Nectar
//
//  Created by Mikail on 23/07/2022.
//

import UIKit

class FavouriteViewController: UIViewController {

    private let collectionView: UICollectionView =  Utilities().defaultCollection()
    
    var favourites:[Favourite] = []
    
    private enum LayoutConstant {
        static let spacing: CGFloat = 0.0
        static let itemHeight: CGFloat = 120.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Favourite"
        
        setupViews()
        getFavourites()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.frame = view.frame
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FavouriteCollectionViewCell.self, forCellWithReuseIdentifier: FavouriteCollectionViewCell.identifier)
        
    }
    
    func getFavourites(){
        FavouriteApiManager.shared.getAllFavourites { result in
            switch result{
            case .success(let response):
                DispatchQueue.main.async {
                    self.favourites = response
                    self.collectionView.reloadData()
                }
            case .failure(_):
                print("An error occured")
            }
        }
    }

}



extension FavouriteViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        favourites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavouriteCollectionViewCell.identifier, for: indexPath) as? FavouriteCollectionViewCell
        else { return UICollectionViewCell() }
        
        let favourite = favourites[indexPath.row]
        cell.setup(favourite: favourite)
        return cell
    }
}

extension FavouriteViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width) - 32
        return CGSize(width: width, height: LayoutConstant.itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top:4, left: LayoutConstant.spacing, bottom: LayoutConstant.spacing, right: LayoutConstant.spacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }
    
}
