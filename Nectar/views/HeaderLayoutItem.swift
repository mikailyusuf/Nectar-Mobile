//
//  HeaderLayoutItem.swift
//  Nectar
//
//  Created by Mikail on 06/08/2022.
//

import UIKit
import SwiftUI


protocol HeaderLayoutItemDelegate:AnyObject{
    
    func seeAllClicked(_ view:HeaderLayoutItem,item:String)
}

class HeaderLayoutItem: UICollectionReusableView {
    static let reuseIdentifier  = "HeaderLayoutItem"
    
    weak var delegate:HeaderLayoutItemDelegate?
    var sectionName:String?
    
    private let seeAllLabel:UILabel = {
       let label = UILabel()
        label.text = "See all"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .primaryGreen
        return label
    }()
    
     private let headerName:UILabel = {
       let label = UILabel()
        label.text = "Exclusive Offer"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
         return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    private func setupLayout(){
    
        addSubview(seeAllLabel)
        addSubview(headerName)
        
        
        headerName.anchor(left:leftAnchor,paddingLeft: 16)
        headerName.centerY(inView: self)
        
        seeAllLabel.anchor(right:rightAnchor,paddingRight: 16)
        seeAllLabel.centerY(inView: self)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(seeAllLabellClicked))
        seeAllLabel.addGestureRecognizer(tapGesture)
        seeAllLabel.isUserInteractionEnabled = true
    }
    
    @objc func seeAllLabellClicked(){
        guard let section = sectionName else {return}
        delegate?.seeAllClicked(self, item: section)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Xib not Specified")
    }
    
    func setup(headerName name:String){
        sectionName = name
        headerName.text = name
    }
        
}


