//
//  OnboardingViewController.swift
//  Nectar
//
//  Created by Mikail on 16/07/2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let imageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bg_photo"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let iconView:UIImageView = {
        let view = UIImageView(image: UIImage(named: "carrot"))
        view.setDimensions(width: 48, height: 56)
        return view
    }()
    
    let buttonGetStarted:UIButton = {
        let button = Utilities().button(withLabel: "Get Started")
        button.addTarget(self, action: #selector(handleGetStartetd), for: .touchUpInside)
        return button
    }()
    
    let descriptionTextLable:UILabel = {
        let label = UILabel()
        label.text = "Get your groceries in as fast as one hour"
        label.font = UIFont(name: Constants.GilroyMedium, size: 16)
        label.textAlignment = .center
        label.textColor = UIColor.grayWhite.withAlphaComponent(0.7)
        return label
    }()
    
    let labelWelcome :UILabel = {
        let label =  UILabel()
        label.text = "Welcome \nto our store"
        label.font = UIFont(name: Constants.GilroyMedium, size: 48)
        label.numberOfLines=0
        label.textAlignment = .center
        label.textColor = UIColor.white
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(iconView)
        view.addSubview(imageView)
        view.addSubview(buttonGetStarted)
        view.addSubview(labelWelcome)
        view.addSubview(descriptionTextLable)
        
        
        imageView.frame = view.frame

        
        buttonGetStarted.anchor(left:view.leftAnchor, bottom:view.bottomAnchor,right:view.rightAnchor,paddingLeft: 16,paddingBottom:90, paddingRight: 16,height: 67)
        
        descriptionTextLable.anchor(left:buttonGetStarted.leftAnchor, bottom:buttonGetStarted.topAnchor,right:buttonGetStarted.rightAnchor,paddingLeft:16, paddingBottom: 40,paddingRight: 16)
        
        labelWelcome.anchor(left:view.leftAnchor, bottom:descriptionTextLable.topAnchor,right:view.rightAnchor,paddingBottom: 20)
        
        
        iconView.centerX(inView: view)
        iconView.anchor(bottom:labelWelcome.topAnchor,paddingBottom: -16)
    }
    
    
    //MARK: Selectors
    
    @objc func handleGetStartetd(){
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)

    }
        
}
