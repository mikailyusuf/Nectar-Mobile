//
//  ProductDetailViewController.swift
//  Nectar
//
//  Created by Mikail on 20/08/2022.
//

import UIKit
import SwiftUI

class ProductDetailViewController: UIViewController {
    
    let productImage:UIImageView = {
        let image = UIImageView(image: UIImage(named: "apple"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let productNameText:UILabel = {
        let label = UILabel()
        label.text = "Natural Red Apple"
        label.textColor = .black
        label.font = UIFont(name: Constants.GilroyBold, size: 26)
        return label
    }()
    
    let productCountlabel:UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .black
        label.font = UIFont(name: Constants.GilroyBold, size: 26)
        return label
    }()
    
    private lazy var productCountView:UIView = {
        let view = UIView()
        view.addSubview(productCountlabel)
                productCountlabel.centerY(inView: view)
                productCountlabel.centerX(inView: view)
        view.layer.borderWidth =  0.5
        view.layer.borderColor = Color.gray.cgColor
        view.layer.cornerRadius = 16
        view.setDimensions(width: 45, height: 45)
        
        return view
    }()
    
    let subtractView:UIView = {
        let view = UIView()
        let image = UIImageView(image: UIImage(named:"subtract"))
        image.tintColor = .primaryGreen
        view.addSubview(image)
        image.centerX(inView: view)
        image.centerY(inView: view)
        image.anchor(width:17, height:3)
        return view
    }()
    
    let addView:UIView = {
        let view = UIView()
        let image = UIImageView(image: UIImage(named:"add_icon"))
        image.tintColor = .primaryGreen
        view.addSubview(image)
        image.centerX(inView: view)
        image.centerY(inView: view)
        image.anchor(width:17, height:17)
        return view
    }()
    
    private lazy var productCountStack:UIStackView = {
       let stack = UIStackView(arrangedSubviews: [subtractView,productCountView,addView])
        stack.axis = .horizontal
        stack.spacing = 16
        stack.distribution = .equalCentering
        return stack
    }()
    
    let productPrice:UILabel = {
        let label = UILabel()
        label.text = "$4.99"
        label.textColor = .black
        label.font = UIFont(name: Constants.GilroyBold, size: 26)
        return label
    }()
    
   private lazy var priceStackView:UIStackView = {
       let stack =  UIStackView(arrangedSubviews: [productCountStack,productPrice])
       stack.distribution = .equalSpacing
       stack.axis = .horizontal
       return stack
    }()
    
    let lineView1:UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let lineView2:UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let lineView3:UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
 
    let arrowRight1:UIImageView = {
        let image = UIImageView(image: UIImage(named: "arrow_right"))
        image.setDimensions(width: 8, height: 8)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let arrowRight2:UIImageView = {
        let image = UIImageView(image: UIImage(named: "arrow_right"))
        image.setDimensions(width: 8, height: 8)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let arrowDown:UIImageView = {
        let image = UIImageView(image: UIImage(named: "arrow_down"))
        return image
    }()
    
    let nutritionsLabel:UILabel = {
        let label = UILabel()
        label.text = "Nutritions"
        label.textColor = .blackTextColor
        label.font = UIFont(name: Constants.GilroyMedium, size: 16)
        return label
    }()
    
    private lazy var nutritionStack:UIStackView = {
       let stack = UIStackView(arrangedSubviews: [nutritionsLabel,arrowRight1])
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    

    let reviewLabel:UILabel = {
        let label = UILabel()
        label.text = "Review"
        label.textColor = .blackTextColor
        label.font = UIFont(name: Constants.GilroyMedium, size: 16)
        return label
    }()
    
    private lazy var reviewStack:UIStackView = {
       let stack = UIStackView(arrangedSubviews: [reviewLabel,arrowRight2])
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    let detailLabel:UILabel = {
        let label = UILabel()
        label.text = "Product Detail"
        label.textColor = .blackTextColor
        label.font = UIFont(name: Constants.GilroyMedium, size: 16)
        return label
    }()
    
    private lazy var productDetailLabelStack:UIStackView = {
       let stack = UIStackView(arrangedSubviews:[ detailLabel,arrowDown])
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stackProductName
    }()
    
    let productDetailText:UILabel = {
        let label = UILabel()
        label.text = "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet."
        label.numberOfLines = 0
        label.textColor = .grayTextColor
        label.font = UIFont(name: Constants.GilroyLight, size: 13)
        return label
    }()
    
    
    private lazy var detailStackView:UIStackView = {
       let stack = UIStackView(arrangedSubviews: [detailLabel,productDetailText])
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()

    let unitDescriptionText:UILabel = {
        let label = UILabel()
        label.text = "1kg, Price"
        label.textColor = .lightGray
        label.font = UIFont(name: Constants.GilroyLight, size: 16)
        return label
    }()
    

    
    let likeImage:UIImageView = {
        let image = UIImageView(image: UIImage(systemName:"heart"))
        image.contentMode = .scaleAspectFit
        image.tintColor = .grayTextColor
        return image
    }()
    
    private lazy var stackProductName:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [productNameText,likeImage])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private lazy var stackUnitDescription:UIStackView = {
       let stack = UIStackView(arrangedSubviews: [stackProductName,unitDescriptionText])
        stack.axis = .vertical
        stack.spacing = 4
        stack.distribution = .fillEqually
        return stack
    }()
    
    let addToBasketBtn:UIButton = {
        let button = Utilities().button(withLabel: "Add To Basket")
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"),
                                                            style: .done, target: self, action: #selector(didTapRight))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(systemName: "arrow.left"),
                                                            style: .done, target: self, action: #selector(didTapRight))
        
        setupViews()
        // Do any additional setup after loading the view.
    }
    
    @objc func didTapRight(){
        
    }
    
    @objc func didTapBack(){
        
    }

    
    private func setupViews(){
        view.addSubview(productImage)
        

        
        productImage.anchor(top:view.topAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 30,height: 300)
        view.addSubview(stackUnitDescription)
        stackUnitDescription.anchor(top:productImage.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 8,paddingLeft: 16,paddingRight: 16)
        
        view.addSubview(priceStackView)
        priceStackView.anchor(top:stackUnitDescription.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 8,paddingLeft: 16,paddingRight: 16)
        
        view.addSubview(lineView1)
        lineView1.anchor(top:priceStackView.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 30,paddingLeft: 16,paddingRight: 16,height: 0.5)
        
        view.addSubview(detailStackView)
        detailStackView.anchor(top:lineView1.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 16,paddingLeft: 16,paddingRight: 16)
        
        view.addSubview(lineView2)
        lineView2.anchor(top:detailStackView.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 24,paddingLeft: 16,paddingRight: 16,height: 0.5)
        view.addSubview(nutritionStack)
        nutritionStack.anchor(top:lineView2.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 8,paddingLeft: 16,paddingRight: 16,height: 30)
        
        view.addSubview(lineView3)
        lineView3.anchor(top:nutritionStack.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 24,paddingLeft: 16,paddingRight: 16,height: 0.5)
        
        view.addSubview(reviewStack)
        reviewStack.anchor(top:lineView3.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 8,paddingLeft: 16,paddingRight: 16,height: 30)
        
        view.addSubview(addToBasketBtn)
        addToBasketBtn.anchor(top:reviewStack.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 24,paddingLeft: 16,paddingRight: 16,height: 67)
        
    }
    
    
}

struct ProductDetailViewControllerRepresentable:UIViewControllerRepresentable{
    
    func makeUIViewController(context: Context) -> some UIViewController {
        UINavigationController(rootViewController: ProductDetailViewController())
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}

struct ProductDetailViewController_Preview:PreviewProvider{
    
    static var previews:some View{
        ProductDetailViewControllerRepresentable()
            .edgesIgnoringSafeArea(.top)
            .environment(\.sizeCategory, ContentSizeCategory.accessibilityMedium)
    }
    
    
}
