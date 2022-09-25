//
//  ProductCollectionViewCell.swift
//  Nectar
//
//  Created by Mikail on 31/07/2022.
//

import UIKit
import SDWebImage

protocol ProductCollectionViewCellDelegate:AnyObject{
    
    func addToFavouritesClicked(_ view:ProductCollectionViewCell,product:Product)
}

class ProductCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ProductCollectionViewCell"
    
    weak var delegate:ProductCollectionViewCellDelegate?
    
    private let productImage:UIImageView = {
       let image = UIImageView(image: UIImage(named: "apple"))
        image.contentMode  = .scaleAspectFill
        image.layer.cornerRadius = 16
        image.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        image.clipsToBounds = true
        return image
    }()
    
    private let productName:UILabel = {
       let label = UILabel()
        label.text = "Banana Test"
        label.numberOfLines = 1
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let unitDescription:UILabel = {
       let label = UILabel()
        label.text = "7pcs, Priceg"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    private let productPrice:UILabel = {
       let label = UILabel()
        label.text = "$4.99"
        label.font = UIFont.systemFont(ofSize: 16)
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
    
   @objc func addToFavouritesClicked(){
        guard let item = productItem else {return}
        delegate?.addToFavouritesClicked(self,product: item)
    }
    
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
        addSubview(unitDescription)

        contentView.layer.cornerRadius = 16
        contentView.layer.borderColor = UIColor(red: 0.886, green: 0.886, blue: 0.886, alpha: 1).cgColor
        contentView.layer.borderWidth = 1
        
        productImage.anchor(top:contentView.topAnchor,left: contentView.leftAnchor,right: contentView.rightAnchor, height: 120)
        
        productName.anchor(top:productImage.bottomAnchor,left: contentView.leftAnchor,right:contentView.rightAnchor,paddingTop:8, paddingLeft: 8,paddingRight: 8)
        
        unitDescription.anchor(top:productName.bottomAnchor,left: contentView.leftAnchor,right: contentView.rightAnchor,paddingTop: 4,paddingLeft: 8,paddingRight: 8)
        
        let stackView = UIStackView(arrangedSubviews: [productPrice,addView])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        contentView.addSubview(stackView)
        stackView.anchor(top:unitDescription.bottomAnchor, left: contentView.leftAnchor,right:contentView.rightAnchor,paddingTop: 16,paddingLeft: 8,paddingRight: 8)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addToFavouritesClicked))
        addView.addGestureRecognizer(tapGesture)
        addView.isUserInteractionEnabled = true

    }
    
    var productItem:Product!
    
    func setup(product:Product){
        productItem = product
        productName.text = product.name
        productPrice.text = product.price.toNaira()
        unitDescription.text = product.description
        productImage.sd_setImage(with: URL(string: product.image), completed: nil)
    }
    
}

