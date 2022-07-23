//
//  Utilities.swift
//  Nectar
//
//  Created by Mikail on 22/07/2022.
//

import Foundation
import UIKit
class Utilities{
    
    func inputContainerView(with labelName:String, textInputField:UITextField)->UIView{
        let view = UIView()
        let label = UILabel()
    
        label.text = labelName
        label.textColor = .secondaryTextColor
        label.font = UIFont(name: Constants.GilroyLight, size: 16)
        view.addSubview(label)
        label.anchor(top:view.topAnchor, left:view.leftAnchor)
        
        view.addSubview(textInputField)
        textInputField.anchor(top:label.bottomAnchor, left:view.leftAnchor,bottom:view.bottomAnchor, right: view.rightAnchor,paddingTop:8, height: 40)
        return view
    }
    
    func textInputField()->UITextField{
        let textField =  UITextField()
        textField.textColor = .black
        textField.borderStyle = .roundedRect
        return textField
    }
    
    func button(withLabel label:String)->UIButton{
        let button = UIButton(type: .system)
        button.setTitle(label, for: .normal)
        button.backgroundColor = UIColor.primaryGreen
        button.layer.cornerRadius = 16
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }
}
