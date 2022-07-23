//
//  LoginViewController.swift
//  Nectar
//
//  Created by Mikail on 22/07/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    let iconView:UIImageView = {
        let view = UIImageView(image: UIImage(named: "carrot_red"))
        view.setDimensions(width: 48, height: 56)
        return view
    }()
    
    let loggingLabelText:UILabel = {
        let label = UILabel()
        label.text = "Logging"
        label.textColor = .black
        label.font = UIFont(name: Constants.GilroyBold, size: 26)
        return label
    }()
    
    let loggingLabelInfoText:UILabel = {
        let label = UILabel()
        label.text = "Enter your emails and password"
        label.textColor = .secondaryTextColor
        label.font = UIFont(name: Constants.GilroyLight, size: 16)
        return label
    }()
    
    let forgotPasswordLabel:UILabel = {
        let label = UILabel()
        label.text = "Forogt Password?"
        label.textColor = .secondaryTextColor
        label.font = UIFont(name: Constants.GilroyLight, size: 14)
        return label
    }()
    
    var emailTextField:UITextField = {
        let textField = Utilities().textInputField()
        return textField
    }()
    
    var passwordTextField:UITextField = {
        let textField = Utilities().textInputField()
        textField.isSecureTextEntry = true
        return textField
    }()
    
    
    lazy var emailContainerView:UIView = {
        let view = Utilities().inputContainerView(with: "Email", textInputField: emailTextField)
        return view
    }()
    
    lazy var passwordContainerView:UIView = {
        let view = Utilities().inputContainerView(with: "Password", textInputField: passwordTextField)
        return view
    }()
    
    let stackView:UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .equalSpacing
        return stack
    }()
    
    let buttonLogin:UIButton = {
        let button = Utilities().button(withLabel: "Log In")
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    let dontHaveAccountLabel:UILabel = {
        let label = UILabel()
        label.text = "Don't have an acount?"
        label.textColor = .black
        label.font = UIFont(name: Constants.GilroyMedium, size: 16)
        return label
    }()
    
    let signuLabel:UILabel = {
        let label = UILabel()
        label.text = "Signup"
        label.textColor = .primaryGreen
        label.font = UIFont(name: Constants.GilroyBold, size: 16)
        return label
    }()
    
    let signUpLabelStackView:UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        return stack
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(iconView)
        view.addSubview(loggingLabelText)
        view.addSubview(loggingLabelInfoText)
        view.addSubview(forgotPasswordLabel)
        view.addSubview(stackView)
        view.addSubview(buttonLogin)
        view.addSubview(signUpLabelStackView)
        
        iconView.centerX(inView: view)
        iconView.anchor(top:view.topAnchor,paddingTop: 88)
        
        loggingLabelText.anchor(top:iconView.bottomAnchor, left:view.leftAnchor,paddingTop:100, paddingLeft: 16)
        
        loggingLabelInfoText.anchor(top:loggingLabelText.bottomAnchor,left: view.leftAnchor,paddingTop:15, paddingLeft: 16)

        
        stackView.addArrangedSubview(emailContainerView)
        stackView.addArrangedSubview(passwordContainerView)
        
        stackView.anchor(top:loggingLabelInfoText.bottomAnchor, left:view.leftAnchor,right: view.rightAnchor,paddingTop:24, paddingLeft:16, paddingRight:16)
        
        forgotPasswordLabel.anchor(top:stackView.bottomAnchor, right:view.rightAnchor,paddingTop:16,paddingRight: 16)
        
        buttonLogin.anchor(top:forgotPasswordLabel.bottomAnchor, left:view.leftAnchor,right: view.rightAnchor,paddingTop: 24,paddingLeft:16, paddingRight: 16,height: 67)
        
        signUpLabelStackView.addArrangedSubview(dontHaveAccountLabel)
        signUpLabelStackView.addArrangedSubview(signuLabel)
        
        signUpLabelStackView.centerX(inView: view)
        signUpLabelStackView.anchor(top:buttonLogin.bottomAnchor,paddingTop: 16)
        
    }
    
    //MARK: Selectors
    @objc func handleLogin(){
        print("Log in clicked")
    }
    
}
