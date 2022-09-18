//
//  CategoryCollectionViewCell.swift
//  Nectar
//
//  Created by Mikail on 20/08/2022.
//

import UIKit
import SwiftUI
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
//        categoryName.text = name
    }
    
    required init?(coder: NSCoder) {
        fatalError("Xib not initialised")
    }
    
}

struct CategoryCollectionViewCellRepresentable:UIViewRepresentable{
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> CategoryCollectionViewCell {
        let cell = CategoryCollectionViewCell()
        return cell
    }
}

struct CategoryCollectionViewCell_Preview:PreviewProvider{
   
    static var previews:some View{
        Group {
            CategoryCollectionViewCellRepresentable()
                .frame(width: 200, height: 180)
        }
    }
}
