//
//  FavouriteCollectionViewCell.swift
//  Nectar
//
//  Created by Mikail on 27/08/2022.
//

import UIKit

class FavouriteCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FavouriteCollectionViewCell"
    
    private let productImage:UIImageView = {
        let image = UIImageView(image: UIImage(named: "sprite"))
        image.contentMode  = .scaleAspectFill
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
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
        let stack = UIStackView(arrangedSubviews: [productName,productPrice])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 8
        return stack
    }()
    

    let lineView:UIView = {
       let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.1)
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(productName)
        addSubview(productImage)
        addSubview(productPrice)
        addSubview(proceedImage)
        addSubview(productNameStack)
        
        productImage.anchor(top:topAnchor,left: leftAnchor, bottom: bottomAnchor,paddingTop: 8,paddingBottom: 8,width:120, height: 120)
        productNameStack.centerY(inView:productImage)
        productNameStack.anchor(left:productImage.rightAnchor,paddingLeft: 16)

        proceedImage.anchor(right:self.rightAnchor,paddingRight: 16)
        proceedImage.centerY(inView: productImage)
        addSubview(lineView)
        lineView.anchor(top:productImage.bottomAnchor,left: leftAnchor,right: rightAnchor,paddingTop:8,height: 0.5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Xib not initialised")
    }
    
    
    func setup(favourite:Favourite){
        productName.text = favourite.name
        productPrice.text = favourite.price.toNaira()
        productImage.sd_setImage(with: URL(string: favourite.image), completed: nil)
        
    }
    
    
}


