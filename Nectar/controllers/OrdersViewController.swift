//
//  CartViewController.swift
//  Nectar
//
//  Created by Mikail on 23/07/2022.
//

import UIKit

class OrdersViewController: UIViewController {

    
    private let collectionView: UICollectionView =  Utilities().defaultCollection()
    
    var orders:[Orders] = []
    
    private enum LayoutConstant {
        static let spacing: CGFloat = 16.0
        static let itemHeight: CGFloat = 120.0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        setupViews()
        getOrders()
        
    }
        
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.frame = view.frame
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(OrderCollectionViewCell.self, forCellWithReuseIdentifier: OrderCollectionViewCell.identifier)
        
        
    }
    
    func getOrders(){
        OrdersApiManager.shared.getAllOrder { order in
            switch order{
            case .success(let data):
                DispatchQueue.main.async {
                    self.orders = data
                    self.collectionView.reloadData()
                }
               
                
            case .failure(_):
                print("An error occured")
            }
        }
    }
    

}


extension OrdersViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        orders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {


    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OrderCollectionViewCell.identifier, for: indexPath) as? OrderCollectionViewCell else {
            return UICollectionViewCell()
        }
        let order = orders[indexPath.row]
        cell.setup(order: order)
        return cell
    }
}


extension OrdersViewController:UICollectionViewDelegateFlowLayout{
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
