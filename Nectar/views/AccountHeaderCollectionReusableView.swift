//
//  AccountHeaderCollectionReusableView.swift
//  Nectar
//
//  Created by Mikail on 28/08/2022.
//

import UIKit
import SwiftUI

protocol AccountHeaderDelegate:AnyObject{
    func changeProfileimage(_ view:AccountHeaderCollectionReusableView)
}

class AccountHeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "AccountHeaderCollectionReusableView"
    weak var delegate:AccountHeaderDelegate?
    
     var userModel:UserModel!{
        didSet{
            print("Items set")
            userProfileImage.image = userModel.image
            userName.text = userModel.username
            userEmail.text = userModel.email
        }
    }
    
     let userProfileImage:UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "person.circle.fill"))
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
    

     let userName:UILabel = {
        let label = UILabel()
        label.text = "Jane Doe"
        label.textColor = .black
        label.font = UIFont(name: Constants.GilroyBold, size: 20)
        return label
    }()
    
    private let userEmail:UILabel = {
        let label = UILabel()
        label.text = "janedoe@mail.com"
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
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(profileImageClicked))
        userProfileImage.addGestureRecognizer(tapGesture)
        userProfileImage.isUserInteractionEnabled = true
    }
 
    
    @objc func profileImageClicked(){
        delegate?.changeProfileimage(self)
    }
}


