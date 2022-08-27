//
//  CartViewController.swift
//  Nectar
//
//  Created by Mikail on 23/07/2022.
//

import UIKit

class CartViewController: UIViewController {

    
    private let collectionView: UICollectionView =  Utilities().defaultCollection()
    
    private enum LayoutConstant {
        static let spacing: CGFloat = 16.0
        static let itemHeight: CGFloat = 100.0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Cart"
        setupViews()
    }
        
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.frame = view.frame
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CartCollectionViewCell.self, forCellWithReuseIdentifier: CartCollectionViewCell.identifier)
        
        
    }
    

}


extension CartViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {


    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CartCollectionViewCell.identifier, for: indexPath) as? CartCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}


extension CartViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width) - 32
        return CGSize(width: width, height: LayoutConstant.itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24, left: LayoutConstant.spacing, bottom: LayoutConstant.spacing, right: LayoutConstant.spacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }
    
}
