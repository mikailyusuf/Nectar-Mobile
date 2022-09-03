//
//  AccountHeaderCollectionReusableView.swift
//  Nectar
//
//  Created by Mikail on 28/08/2022.
//

import UIKit
import SwiftUI

class AccountHeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "AccountHeaderCollectionReusableView"
    
    private let userProfileImage:UIImageView = {
        let image = UIImageView(image: UIImage(named: "userImage"))
        image.contentMode  = .scaleAspectFit
        image.layer.cornerRadius = 20
        image.setDimensions(width: 65, height: 65)
        return image
    }()
    
    private let editIcon:UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "pencil"))
        image.contentMode  = .scaleAspectFit
        image.tintColor = .primaryGreen
        image.setDimensions(width: 15, height: 15)
        return image
    }()
    

    private let userName:UILabel = {
        let label = UILabel()
        label.text = "Afsar Hossein"
        label.textColor = .black
        label.font = UIFont(name: Constants.GilroyBold, size: 20)
        return label
    }()
    
    private let userEmail:UILabel = {
        let label = UILabel()
        label.text = "afsarhussein@yahoo.com"
        label.textColor = .grayTextColor
        label.font = UIFont(name: Constants.GilroyMedium, size: 16)
        return label
    }()
    
    private lazy var nameStack:UIStackView = {
       let stack = UIStackView(arrangedSubviews: [userName,editIcon])
        stack.distribution = .equalSpacing
        stack.axis = .horizontal
        stack.alignment = .center
        return stack
    }()
    
    
    private lazy var mainStack:UIStackView = {
       let stack = UIStackView(arrangedSubviews: [nameStack,userEmail])
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()

    
    override func layoutSubviews() {
        addSubview(userProfileImage)
        addSubview(mainStack)
        userProfileImage.anchor(top:topAnchor,left:leftAnchor,paddingTop: 16,paddingLeft: 16)
        mainStack.anchor(left:userProfileImage.rightAnchor,paddingLeft: 16)
        mainStack.centerY(inView: userProfileImage)
    }
        
}

struct  AccountHeaderCollectionReusableView_Representable:UIViewRepresentable{
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> AccountHeaderCollectionReusableView {
        let header = AccountHeaderCollectionReusableView()
        return header
    }
}

struct AccountyHeader_Preview:PreviewProvider{
    
    static var previews: some View{
        Group{
            AccountHeaderCollectionReusableView_Representable()
                .frame(width: 300, height: 30)
        }
    }
}
