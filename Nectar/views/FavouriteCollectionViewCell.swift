//
//  FavouriteCollectionViewCell.swift
//  Nectar
//
//  Created by Mikail on 27/08/2022.
//

import UIKit
import SwiftUI

class FavouriteCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FavouriteCollectionViewCell"
    
    private let productImage:UIImageView = {
        let image = UIImageView(image: UIImage(named: "sprite"))
        image.contentMode  = .scaleAspectFit
        image.setDimensions(width: 60, height: 60)
        return image
    }()
    
    private let proceedImage:UIImageView = {
        let image = UIImageView(image: UIImage(named: "arrow_right"))
        image.contentMode  = .scaleAspectFit
        image.setDimensions(width: 14, height: 14)
        return image
    }()
    
    private let productName:UILabel = {
        let label = UILabel()
        label.text = "Bell Pepper Red"
        label.textColor = .black
        label.font = UIFont(name: Constants.GilroyBold, size: 16)
        return label
    }()
    

    
    private let unitDescriptionLabel:UILabel = {
        let label = UILabel()
        label.text = "1kg, Price"
        label.textColor = .grayTextColor
        label.font = UIFont(name: Constants.GilroyLight, size: 14)
        return label
    }()
    
    
    private let productPrice:UILabel = {
        let label = UILabel()
        label.text = "$4.99"
        label.textColor = .black
        label.font = UIFont(name: Constants.GilroyLight, size: 16)
        return label
    }()
    
    private lazy var productNameStack:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [productName,unitDescriptionLabel])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 8
        return stack
    }()
    
    private lazy var priceStack:UIStackView = {
       let stack = UIStackView(arrangedSubviews: [productPrice,proceedImage])
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    
    private lazy var mainStackView:UIStackView = {
       let stack = UIStackView(arrangedSubviews: [productImage,productNameStack,priceStack])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    let lineView:UIView = {
       let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.1)
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mainStackView)
        addSubview(productImage)
        addSubview(productNameStack)
        addSubview(priceStack)
        productImage.anchor(top:topAnchor,left: leftAnchor)
        productNameStack.anchor(top:topAnchor,left: productImage.rightAnchor,paddingLeft: 24)
        priceStack.anchor(right:rightAnchor)
        priceStack.centerY(inView: productNameStack)
        
        addSubview(lineView)
        lineView.anchor(top:productImage.bottomAnchor,left: leftAnchor,right: rightAnchor,paddingTop: 24,height: 0.5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Xib not initialised")
    }
    
    
}


struct  FavouriteCollectionViewCellRepresentable:UIViewRepresentable{
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> FavouriteCollectionViewCell {
        let cell = FavouriteCollectionViewCell()
        return cell
    }
}

struct FavouriteCollectionViewCell_Preview:PreviewProvider{
    
    static var previews: some View{
        Group{
            FavouriteCollectionViewCellRepresentable()
                .frame(width: 300, height: 180)
        }
    }
}
