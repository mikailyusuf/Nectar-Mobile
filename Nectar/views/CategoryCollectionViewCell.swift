//
//  CategoryCollectionViewCell.swift
//  Nectar
//
//  Created by Mikail on 20/08/2022.
//

import UIKit
import RandomColorSwift

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"
    
    private enum LayoutConstant {
        static let padding: CGFloat = 16.0

    }
    
    private let categoryImage:UIImageView = {
       let image = UIImageView(image: UIImage(named: "meat"))
        image.contentMode  = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        
        return image
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let color = randomColor()
        
        layer.borderWidth = 1
        layer.cornerRadius = LayoutConstant.padding
        layer.borderColor = color.cgColor
        layer.backgroundColor = color.cgColor.copy(alpha: 0.1)
        setupViews()
    }
    
    
    
    private func setupViews(){
        addSubview(categoryImage)
      
        categoryImage.anchor(top:topAnchor,left: leftAnchor,bottom:bottomAnchor, right:rightAnchor)
        }
    
    
    func setup(brand:Brand){
        categoryImage.sd_setImage(with: URL(string: brand.image), completed: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("Xib not initialised")
    }
    
}

