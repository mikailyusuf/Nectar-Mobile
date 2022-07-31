//
//  ShopViewController.swift
//  Nectar
//
//  Created by Mikail on 23/07/2022.
//

import UIKit

class ShopViewController: UIViewController {
    
    let imageIcon:UIImageView = {
        let image = UIImageView(image: UIImage(named: "carrot_red"))
        image.setDimensions(width: 16, height: 16)
        return image
    }()
    
    let locationStack:UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4
        return stack
    }()
    
    
    let locationIcon:UIImageView = {
        let icon = UIImageView(image: UIImage(systemName: "location"))
        return icon
    }()
    
    let userLocationLabel:UILabel = {
        let label = UILabel()
        label.text = "Dhaka, Banassre"
        label.font = UIFont(name: Constants.GilroyMedium, size: 16)
        return label
    }()
    
    let searchBar:UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.placeholder = "Search Store"
        return searchBar
    }()
    
    let headerImageView:UIImageView = {
        let image = UIImage(named: "banner")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    let offersStack:UIStackView = {
       let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        return stackView
    }()
    
    let offerLabel:UILabel = {
       let label = UILabel()
        label.text = "Exclusive Offer"
        label.font = UIFont(name: Constants.GilroyBold, size: 24)
        return label
    }()
    
    let seeAllLabel:UILabel = {
        let label = UILabel()
        label.text = "See all"
        label.textColor = .primaryGreen
        label.font = UIFont(name: Constants.GilroyMedium, size: 16)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageIcon)
        view.addSubview(locationStack)
        view.addSubview(searchBar)
        view.addSubview(headerImageView)
        
        imageIcon.centerX(inView: view)
        imageIcon.anchor(top:view.safeAreaLayoutGuide.topAnchor)
        
        locationStack.addArrangedSubview(locationIcon)
        locationStack.addArrangedSubview(userLocationLabel)
        locationStack.centerX(inView: view)
        locationStack.anchor(top:imageIcon.bottomAnchor)
        
        searchBar.anchor(top:locationStack.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingLeft: 16,paddingRight: 16)
        
        headerImageView.anchor(top:searchBar.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 4,paddingLeft:16, paddingRight:16, height: 120)
        
        
    }
    
}
