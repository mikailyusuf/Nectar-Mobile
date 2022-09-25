//
//  AccountFooterCollectionReusableView.swift
//  Nectar
//
//  Created by Mikail on 28/08/2022.
//

import UIKit

protocol AccountFooterDelegate:AnyObject{
    func logout(_ footer:AccountFooterCollectionReusableView)
}

class AccountFooterCollectionReusableView: UICollectionReusableView {
    static let identifier = "AccountFooterCollectionReusableView"
    
    
    weak var delegate:AccountFooterDelegate?
    let logOutText:UILabel = {
        let label = UILabel()
        label.text = "Log Out"
        label.textColor = .primaryGreen
        return label
    }()

    private let logoutIcon:UIImageView = {
        let image = UIImageView(image: UIImage(named: "logout"))
        image.contentMode  = .scaleAspectFit
        image.setDimensions(width: 14, height: 14)
        return image
    }()

    lazy var logoutView:UIView = {
       let view = UIView()

        view.addSubview(logoutIcon)
        view.addSubview(logOutText)
        logoutIcon.anchor(top:view.topAnchor,left:view.leftAnchor,bottom: view.bottomAnchor,paddingLeft: 16,width:14, height: 14)
        logoutIcon.centerY(inView: view)
        logOutText.centerY(inView: view)
        logOutText.centerX(inView: view)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        view.layer.cornerRadius = 8
        return view
    }()
        
    override func layoutSubviews() {
                addSubview(logoutView)
        logoutView.anchor(top:topAnchor,left:leftAnchor, bottom:bottomAnchor, right: rightAnchor,paddingLeft: 16,paddingRight: 16,height: 200)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(logoutClicked))
        logoutView.addGestureRecognizer(tapGesture)
        logoutView.isUserInteractionEnabled = true
    }
    
    @objc func logoutClicked(){
        delegate?.logout(self)
    }
}

