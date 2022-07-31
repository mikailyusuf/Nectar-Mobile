//
//  ProductCollectionViewCell.swift
//  Nectar
//
//  Created by Mikail on 31/07/2022.
//

import UIKit
import SwiftUI

class ProductCollectionViewCell: UICollectionViewCell {
    
    private let productImage:UIImageView = {
       let image = UIImageView(image: UIImage(named: "apple"))
        image.setDimensions(width: 120, height: 80)
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let productName:UILabel = {
       let label = UILabel()
        label.text = "Banana Test"
        return label
    }()
    
    private let unitDescription:UILabel = {
       let label = UILabel()
        label.text = "7pcs, Priceg"
        return label
    }()
    
    private let productPrice:UILabel = {
       let label = UILabel()
        label.text = "$4.99"
        return label
    }()
    
    
    private let addView:UIView = {
        
       let view = UIView()
        view.backgroundColor = .primaryGreen
        view.layer.cornerRadius = 8
        let addIcon = UIImageView(image: UIImage(systemName: "plus"))
        addIcon.tintColor = .white
        view.addSubview(addIcon)
        addIcon.centerX(inView: view)
        addIcon.centerY(inView: view)
        view.setDimensions(width: 45, height: 45)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("Xib not supported")
    }
    
    private func setupLayout(){
        
        addSubview(productName)
        addSubview(productImage)
        addSubview(addView)
        addSubview(unitDescription)
        addSubview(productPrice)
        
//        contentView.backgroundColor = .red
        
        contentView.layer.cornerRadius = 16
        contentView.layer.borderColor = UIColor(red: 0.886, green: 0.886, blue: 0.886, alpha: 1).cgColor
        contentView.layer.borderWidth = 1
        
        productImage.anchor(top:contentView.topAnchor,left: contentView.leftAnchor,right: contentView.rightAnchor,paddingTop:8, height: 80)
        productName.anchor(top:productImage.bottomAnchor,left: contentView.leftAnchor,paddingTop:8, paddingLeft: 16)
        
        unitDescription.anchor(top:productName.bottomAnchor,left: contentView.leftAnchor,paddingTop: 8,paddingLeft: 16)
        
        productPrice.anchor(left: contentView.leftAnchor, bottom:contentView.bottomAnchor,paddingLeft: 16, paddingBottom: -24)
        
        addView.anchor(bottom:contentView.bottomAnchor, right:contentView.rightAnchor, paddingRight: -16)
    }
    
}


struct ProductCollectionViewCellRepresentable:UIViewRepresentable{
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> ProductCollectionViewCell {
        let cell = ProductCollectionViewCell()
//        cell.contentView.backgroundColor = .blue
        return cell
    }
}

struct ProductCollectionViewCell_Preview:PreviewProvider{
    static var previews:some View{
        ProductCollectionViewCellRepresentable()
            .frame(width: 170, height: 250)
    }
}
