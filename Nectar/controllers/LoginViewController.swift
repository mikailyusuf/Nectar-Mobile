//
//  LoginViewController.swift
//  Nectar
//
//  Created by Mikail on 22/07/2022.
//

import UIKit
import ToastViewSwift

class LoginViewController: UIViewController {
    
    
    let iconView:UIImageView = {
        let view = UIImageView(image: UIImage(named: "app_icon"))
        view.setDimensions(width: 120, height: 100)
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
        textField.addTarget(self, action: #selector(emailTextFieldChanged), for: .editingChanged)
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
        setupViews()
    
    }
    
    
    //MARK: setupviews
    func setupViews(){
        view.addSubview(iconView)
        view.addSubview(loggingLabelText)
        view.addSubview(loggingLabelInfoText)
        view.addSubview(forgotPasswordLabel)
        view.addSubview(stackView)
        view.addSubview(buttonLogin)
        view.addSubview(signUpLabelStackView)
        
        let topMargin = view.safeAreaInsets.top + 20
        iconView.centerX(inView: view)
        iconView.anchor(top:view.topAnchor,paddingTop:topMargin)
        
        loggingLabelText.anchor(top:iconView.bottomAnchor, left:view.leftAnchor,paddingTop:30, paddingLeft: 16)
        
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
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(handleCreateAccountTapped))
        signUpLabelStackView.isUserInteractionEnabled = true
        signUpLabelStackView.addGestureRecognizer(labelTap)
        
        self.passwordTextField.delegate = self
        self.emailTextField.delegate = self
    }
    
    
    //MARK: Selectors
    @objc func handleLogin(){
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        
        self.view.showProgress()
        DispatchQueue.global(qos: .background).async {
            AuthApiManager.shared.loginUser(email: email, password: password) { result in
                switch result{
                case .success(_):
                    self.navigateToHomeScreen()
                case .failure(let error):

                    DispatchQueue.main.async {
                        self.view.hideProgress()
                        Toast.text(error.localizedDescription).show()
                    }
                }
            }
        }
    
    }
    
    func navigateToHomeScreen(){
        DispatchQueue.main.async {
            self.view.hideProgress()
            self.presentHomeScreen()
        }
      
    }
    
    
    func presentHomeScreen(){
        
        navigationController?.viewControllers.removeAll()
//        navigationController?.pushViewController(HomeViewController(), animated: false)
      
            let navigationController = UINavigationController(rootViewController: HomeViewController())
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            appdelegate.window!.rootViewController = navigationController
        
    }
    
    @objc func handleCreateAccountTapped(){
        navigationController?.pushViewController(SignUpViewController(), animated: false)
    }
    
    
    @objc func emailTextFieldChanged() {
        emailTextField.text = emailTextField.text?.lowercased()
    }
    
}

extension LoginViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
