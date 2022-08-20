//
//  CategoryCollectionViewCell.swift
//  Nectar
//
//  Created by Mikail on 20/08/2022.
//

import UIKit
import SwiftUI

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"
    
    private enum LayoutConstant {
        static let padding: CGFloat = 16.0

    }
    
    private let categoryImage:UIImageView = {
       let image = UIImageView(image: UIImage(named: "meat"))
        image.contentMode  = .scaleToFill
        return image
    }()
    
    private let categoryName:UILabel = {
       let label = UILabel()
        label.text = "Frash Fruits\n & Vegetable"
        label.textColor = .black
        label.font = UIFont(name: Constants.GilroyBold, size: 26)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 2
        layer.cornerRadius = LayoutConstant.padding
        layer.borderColor = Color.red.cgColor
        setupViews()
    }
    
    
    
    private func setupViews(){
        addSubview(categoryImage)
        addSubview(categoryName)
        
        categoryImage.anchor(top:topAnchor,left: leftAnchor,right:rightAnchor,paddingTop: LayoutConstant.padding,paddingLeft: LayoutConstant.padding,paddingRight: LayoutConstant.padding)
        
        categoryName.anchor(top:categoryImage.bottomAnchor, paddingTop: LayoutConstant.padding)
        categoryName.centerX(inView: self)
        
    }
    
    
    func setup(name:String){
        categoryName.text = name
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
                .frame(width: 200, height: 220)
        }
    }
}
