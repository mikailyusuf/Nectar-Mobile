//
//  ProductDetailViewController.swift
//  Nectar
//
//  Created by Mikail on 20/08/2022.
//

import UIKit
import SwiftUI

class ProductDetailViewController: UIViewController {
    
    var product:Product!
    
    let productImage:UIImageView = {
        let image = UIImageView(image: UIImage(named: "apple"))
        image.contentMode = .scaleToFill     //.scaleAspectFill
        return image
    }()
    
    let productNameText:UILabel = {
        let label = UILabel()
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
//        view.layer.borderColor = Color.black.
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
    
    let dexcriptionDivider:UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
  
    
    let reviewDivider:UIView = {
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
       let stack = UIStackView(arrangedSubviews: [stackProductName])
        stack.axis = .vertical
        stack.spacing = 4
        stack.distribution = .fillEqually
        return stack
    }()
    
    let addToBasketBtn:UIButton = {
        let button = Utilities().button(withLabel: "Order")
        button.addTarget(self, action: #selector(orderButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.largeTitleDisplayMode = .never
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"),
//                                                            style: .done, target: self, action: #selector(didTapRight))
//
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(systemName: "arrow.left"),
//                                                            style: .done, target: self, action: #selector(didTapBack))
        setupViews()
        setData()
    }
    
    func setData(){
        guard let product = product else {return}
    
        productImage.sd_setImage(with: URL(string: product.image), completed: nil)
        detailLabel.text = product.description
        productNameText.text = product.name
        productPrice.text = product.price.toNaira()
    }
    
    private func setupViews(){
        view.addSubview(productImage)
        view.addSubview(stackUnitDescription)
        view.addSubview(priceStackView)
        view.addSubview(dexcriptionDivider)
        view.addSubview(detailStackView)
        view.addSubview(reviewDivider)
        view.addSubview(reviewStack)
        view.addSubview(addToBasketBtn)
        
        
        productImage.anchor(top:view.topAnchor,left: view.leftAnchor,right: view.rightAnchor,height: 300)
      
        stackUnitDescription.anchor(top:productImage.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 8,paddingLeft: 16,paddingRight: 16)
        
       
        priceStackView.anchor(top:stackUnitDescription.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 8,paddingLeft: 16,paddingRight: 16)
        
       
        dexcriptionDivider.anchor(top:priceStackView.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 30,paddingLeft: 16,paddingRight: 16,height: 0.5)
        
      
        detailStackView.anchor(top:dexcriptionDivider.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 16,paddingLeft: 16,paddingRight: 16)
              
        reviewDivider.anchor(top:detailStackView.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 24,paddingLeft: 16,paddingRight: 16,height: 0.5)
        
        
        reviewStack.anchor(top:reviewDivider.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 8,paddingLeft: 16,paddingRight: 16,height: 30)
        
        

        addToBasketBtn.anchor(top:reviewStack.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 24,paddingLeft: 16,paddingRight: 16,height: 67)
        
    }
    
    
    //MARK: Selectors
    @objc func orderButtonTapped(){
        self.view.showProgress()
        createOrder()
    }
    
    //MARK: API CALL
    private func createOrder(){
        DispatchQueue.global(qos: .background).async {
            OrdersApiManager.shared.createOrder(withId: self.product.id) { result in
                switch result{
                case .success(let model):
                    DispatchQueue.main.async {
                        self.view.hideProgress()
                        self.gotoCheckOutController(checkoutUrl: model.payment_url)
                    }
                
                case .failure(_):
                    DispatchQueue.main.async {
                        self.view.hideProgress()
                    }
                  
                }
            }
        }
   
    }
    
    func gotoCheckOutController(checkoutUrl:String){
        DispatchQueue.main.async {
            let vc = CheckoutViewController()
            vc.pstkUrl = checkoutUrl
            self.navigationController?.pushViewController(vc, animated: false)
        }

    }

    
//    @objc func didTapRight(){
//
//    }
//
//    @objc func didTapBack(){
//        navigationController?.popViewController(animated: true)
//    }

    
 
}

