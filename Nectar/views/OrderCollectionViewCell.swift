//
//  CartCollectionViewCell.swift
//  Nectar
//
//  Created by Mikail on 21/08/2022.
//

import UIKit
import SwiftUI

class OrderCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "OrderCollectionViewCell"
    
    private let productImage:UIImageView = {
        let image = UIImageView(image: UIImage(named: "banana"))
        image.contentMode  = .scaleToFill
        image.layer.cornerRadius = 8
        image.layer.masksToBounds = true
        image.setDimensions(width: 120, height: 100)
        return image
    }()

    
    private let productName:UILabel = {
        let label = UILabel()
        label.text = "Bell Pepper Red"
        label.textColor = .black
        label.font = UIFont(name: Constants.GilroyBold, size: 16)
        return label
    }()

    
    private let productStatus:UILabel = {
        let label = UILabel()
        label.text = "in progress"
        label.textColor = .black
        label.font = UIFont(name: Constants.GilroyBold, size: 18)
        return label
    }()
    

    let lineView:UIView = {
       let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.1)
        return view
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(productImage)
        addSubview(productStatus)
        addSubview(productName)
        addSubview(lineView)
        
        productImage.anchor(top:topAnchor,left:leftAnchor, bottom: bottomAnchor,paddingLeft: 8,paddingBottom: 8)
        
        productName.anchor(top:topAnchor,left: productImage.rightAnchor,paddingLeft: 16)
        
        productStatus.anchor(top:productName.bottomAnchor,left: productName.leftAnchor,paddingTop: 8)
        
        lineView.anchor(left:leftAnchor,bottom: bottomAnchor,right: rightAnchor,paddingLeft: 8, paddingRight: 8,height: 1)
        
    }

    required init?(coder: NSCoder) {
        fatalError("Xib not initialised")
    }
    
    
    func setup(order:Orders){
        productImage.sd_setImage(with: URL(string: order.image), completed: nil)
        productName.text = order.name
        productStatus.text = "# \(order.is_paid)"
    }
}

struct  OrderCollectionViewCell_Representable:UIViewRepresentable{
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> OrderCollectionViewCell {
        let header = OrderCollectionViewCell()
        return header
    }
}

struct OrderCollectionViewCell_Preview:PreviewProvider{
    
    static var previews: some View{
        Group{
            OrderCollectionViewCell_Representable()
                .frame(width: 300, height: 120)
        }
    }
}

