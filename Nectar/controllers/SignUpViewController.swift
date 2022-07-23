//
//  SignUpViewController.swift
//  Nectar
//
//  Created by Mikail on 22/07/2022.
//

import UIKit

class SignUpViewController: UIViewController {

    let iconView:UIImageView = {
        let view = UIImageView(image: UIImage(named: "carrot_red"))
        view.setDimensions(width: 48, height: 56)
        return view
    }()
    
    let signupLabelText:UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.textColor = .black
        label.font = UIFont(name: Constants.GilroyBold, size: 26)
        return label
    }()
    
    let credentialsInfoText:UILabel = {
        let label = UILabel()
        label.text = "Enter your credentials to continue"
        label.textColor = .secondaryTextColor
        label.font = UIFont(name: Constants.GilroyLight, size: 16)
        return label
    }()
    
    let termsofServiceLabel:UILabel = {
        let label = UILabel()
        label.text = "By continuing you agree to our Terms of Service and Privacy Policy."
        label.numberOfLines = 2
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
    
    
    var usernameTextField:UITextField = {
        let textField = Utilities().textInputField()
        return textField
    }()
    
    lazy var usernameContainerView:UIView = {
        let view = Utilities().inputContainerView(with: "Username", textInputField: usernameTextField)
        return view
    }()
    
    lazy var emailContainerView:UIView = {
        let view = Utilities().inputContainerView(with: "Email", textInputField: emailTextField)
        return view
    }()
    
    lazy var passwordContainerView:UIView = {
        let view = Utilities().inputContainerView(with: "Password", textInputField: passwordTextField)
        return view
    }()
    
    let inputStackView:UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .equalSpacing
        return stack
    }()
    
    let buttonSigup:UIButton = {
        let button = Utilities().button(withLabel: "Sign Up")
        button.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
        return button
    }()
    
    let dontHaveAccountLabel:UILabel = {
        let label = UILabel()
        label.text = "Already have an acount?"
        label.textColor = .black
        label.font = UIFont(name: Constants.GilroyMedium, size: 16)
        return label
    }()
    
    let loginLabel:UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .primaryGreen
        label.font = UIFont(name: Constants.GilroyBold, size: 16)
        return label
    }()
    
    let loginLabelStackView:UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(iconView)
        view.addSubview(signupLabelText)
        view.addSubview(credentialsInfoText)
        view.addSubview(inputStackView)
        view.addSubview(termsofServiceLabel)
        view.addSubview(loginLabelStackView)
        view.addSubview(buttonSigup)
        
        iconView.centerX(inView: view)
        iconView.anchor(top:view.topAnchor,paddingTop: 88)
        
        signupLabelText.anchor(top:iconView.bottomAnchor, left:view.leftAnchor,paddingTop:100, paddingLeft: 16)
        
        credentialsInfoText.anchor(top:signupLabelText.bottomAnchor,left: view.leftAnchor,paddingTop:15, paddingLeft: 16)

        
        inputStackView.addArrangedSubview(usernameContainerView)
        inputStackView.addArrangedSubview(emailContainerView)
        inputStackView.addArrangedSubview(passwordContainerView)
        
        inputStackView.anchor(top:credentialsInfoText.bottomAnchor, left:view.leftAnchor,right: view.rightAnchor,paddingTop:24, paddingLeft:16, paddingRight:16)
        
        termsofServiceLabel.anchor(top:inputStackView.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 16,paddingLeft: 16,paddingRight: 16)
        
        buttonSigup.anchor(top:termsofServiceLabel.bottomAnchor, left:view.leftAnchor,right: view.rightAnchor,paddingTop: 24,paddingLeft:16, paddingRight: 16,height: 67)
        
        loginLabelStackView.addArrangedSubview(dontHaveAccountLabel)
        loginLabelStackView.addArrangedSubview(loginLabel)
        
        loginLabelStackView.centerX(inView: view)
        loginLabelStackView.anchor(top:buttonSigup.bottomAnchor,paddingTop: 16)
    }
    
//MARK: selectors
    
    @objc func handleSignup(){
        
    }


}
