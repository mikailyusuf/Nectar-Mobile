//
//  HeaderLayoutItem.swift
//  Nectar
//
//  Created by Mikail on 06/08/2022.
//

import UIKit
import SwiftUI

class HeaderLayoutItem: UICollectionReusableView {
    static let reuseIdentifier  = "HeaderLayoutItem"
    
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("Xib not Specified")
    }
    
    func setup(headerName name:String){
        headerName.text = name
    }
        
}

struct HeaderLayoutItemRepresentable:UIViewRepresentable{
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> HeaderLayoutItem {
        let header = HeaderLayoutItem()
        return header
    }
    
}

struct HeaderLayoutItem_Preview:PreviewProvider{
    
    static var previews:some View{
        Group {
            HeaderLayoutItemRepresentable()
                .frame(width: 300, height: 50)
        }
    }
}
