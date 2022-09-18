//
//  AccountCollectionViewCell.swift
//  Nectar
//
//  Created by Mikail on 27/08/2022.
//

import UIKit
import SwiftUI

class AccountCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AccountCollectionViewCell"
    
    private let icon:UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "bell"))
        image.contentMode  = .scaleAspectFit
        image.setDimensions(width: 24, height: 24)
        return image
    }()
    
    private let proceedImage:UIImageView = {
        let image = UIImageView(image: UIImage(named: "arrow_right"))
        image.contentMode  = .scaleAspectFit
        image.setDimensions(width: 8, height: 14)
        return image
    }()
    
    private let itemName:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Constants.GilroyBold, size: 16)
        return label
    }()
    
    let lineView:UIView = {
       let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.1)
        return view
    }()
   
    
    func setup(item:SettingsItem){
        itemName.text = item.title
        icon.image = item.icon
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(icon)
        addSubview(proceedImage)
        addSubview(itemName)
        addSubview(lineView)

        icon.anchor(left:leftAnchor)
        icon.centerY(inView: self)
        itemName.anchor(left:icon.rightAnchor,paddingLeft: 16)
        proceedImage.anchor(top:topAnchor,bottom: bottomAnchor,right:rightAnchor)
       
        itemName.centerY(inView: self)
        proceedImage.centerY(inView: self)
        
        lineView.anchor(top:itemName.bottomAnchor,left: leftAnchor,right: rightAnchor,paddingTop: 16,height: 0.5)
        
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("Xib not required")
    }
    
}


struct  AccountCollectionViewCellRepresentable:UIViewRepresentable{
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> AccountCollectionViewCell {
        let cell = AccountCollectionViewCell()
        return cell
    }
}

struct AccountCollectionViewCell_Preview:PreviewProvider{
    
    static var previews: some View{
        Group{
            AccountCollectionViewCellRepresentable()
                .frame(width: 300, height: 30)
        }
    }
}
