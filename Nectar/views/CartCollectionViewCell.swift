//
//  CartCollectionViewCell.swift
//  Nectar
//
//  Created by Mikail on 21/08/2022.
//

import UIKit
import SwiftUI

class CartCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CartCollectionViewCell"
    
    private let productImage:UIImageView = {
        let image = UIImageView(image: UIImage(named: "banana"))
        image.contentMode  = .scaleAspectFit
        image.setDimensions(width: 80, height: 80)
        return image
    }()
    
    private lazy var imageContainerView:UIView = {
       
        let view = UIView()
        view.addSubview(productImage)
        view.centerX(inView: view)
        view.centerY(inView: view)
        return view
    }()
    
    private let cancelImage:UIImageView = {
        let image = UIImageView(image: UIImage(named: "cancel_gray"))
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
        label.font = UIFont(name: Constants.GilroyBold, size: 18)
        return label
    }()
    
    private let roundedMinusView:UIView = {
        let image = UIImageView(image:UIImage(named: "subtract"))
        image.setDimensions(width: 8, height: 2)
        let view = Utilities().roundedView(withImage:image)
        return view
    }()
    
    private let roundedAddView:UIView = {
        
        let image = UIImageView(image:UIImage(named: "add_icon"))
        image.setDimensions(width: 8, height: 8)
        let view = Utilities().roundedView(withImage:image)
        return view
    }()
    
    private let cartCount:UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .gray
        label.font = UIFont(name: Constants.GilroyBold, size: 18)
        return label
    }()
    
    
    private lazy var nameStack:UIStackView = {
        let stack = UIStackView(arrangedSubviews:[productName,cancelImage])
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private lazy var countViews:UIStackView = {
       let stack = UIStackView(arrangedSubviews: [roundedMinusView,cartCount,roundedAddView])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 12
        return stack
    }()
    
    private lazy var productPriceStack:UIStackView = {
        let stack = UIStackView(arrangedSubviews:[countViews,productPrice])
        stack.distribution = .equalSpacing
        stack.axis = .horizontal
        return stack
    }()
    
    private lazy var verticalStack:UIStackView = {
       let stack = UIStackView(arrangedSubviews: [nameStack,unitDescriptionLabel,productPriceStack])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 8
        return stack
    }()
    
    private lazy var mainStackView:UIStackView = {
       let stack = UIStackView(arrangedSubviews: [productImage,verticalStack])
        stack.axis = .horizontal
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
        
        addSubview(mainStackView)
        mainStackView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
        
        addSubview(lineView)
        lineView.anchor(top:mainStackView.bottomAnchor,left: leftAnchor,right: rightAnchor,paddingTop: 24,height: 0.5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Xib not initialised")
    }
    
}


struct  CartCollectionViewCellRepresentable:UIViewRepresentable{
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> CartCollectionViewCell {
        let cell = CartCollectionViewCell()
        return cell
    }
}

struct CartCollectionViewCell_Preview:PreviewProvider{
    
    static var previews: some View{
        Group{
            CartCollectionViewCellRepresentable()
                .frame(width: 300, height: 180)
        }
    }
}
