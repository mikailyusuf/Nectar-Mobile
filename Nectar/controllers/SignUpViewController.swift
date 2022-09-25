//
//  SignUpViewController.swift
//  Nectar
//
//  Created by Mikail on 22/07/2022.
//

import UIKit
import ToastViewSwift

class SignUpViewController: UIViewController {
  
    
    // to store the current active textfield
      var activeTextField : UITextField? = nil
    
    let iconView:UIImageView = {
        let view = UIImageView(image: UIImage(named: "app_icon"))
        view.setDimensions(width: 120, height: 100)
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
        textField.textContentType = .emailAddress
        return textField
    }()
    
    var passwordTextField:UITextField = {
        let textField = Utilities().textInputField()
//        textField.isSecureTextEntry = true
//        textField.textContentType = .password
        return textField
    }()
    
    
    var usernameTextField:UITextField = {
        let textField = Utilities().textInputField()
        textField.textContentType = .username
        return textField
    }()
    
    var phoneNumberTextField:UITextField = {
        let textField = Utilities().textInputField()
        textField.textContentType = .telephoneNumber
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
    
    
    lazy var phoneNumberContainerView:UIView = {
        let view = Utilities().inputContainerView(with: "Phone Number", textInputField: phoneNumberTextField)
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
  

        setupViews()
        
        // call the 'keyboardWillShow' function when the view controller receive the notification that a keyboard is going to be shown
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
          
              // call the 'keyboardWillHide' function when the view controlelr receive notification that keyboard is going to be hidden
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {

      guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {

        // if keyboard size is not available for some reason, dont do anything
        return
      }

      var shouldMoveViewUp = false

      // if active text field is not nil
      if let activeTextField = activeTextField {

        let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY;
        
        let topOfKeyboard = self.view.frame.height - keyboardSize.height

        // if the bottom of Textfield is below the top of keyboard, move up
        if bottomOfTextField > topOfKeyboard {
          shouldMoveViewUp = true
        }
      }

      if(shouldMoveViewUp) {
        self.view.frame.origin.y = 0 - keyboardSize.height
      }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
      // move back the root view origin to zero
      self.view.frame.origin.y = 0
    }
    
    
    func setupViews(){
        view.addSubview(iconView)
        view.addSubview(signupLabelText)
        view.addSubview(credentialsInfoText)
        view.addSubview(inputStackView)
        view.addSubview(termsofServiceLabel)
        view.addSubview(loginLabelStackView)
        view.addSubview(buttonSigup)
        
        let topMargin = view.safeAreaInsets.top + 20
        
        iconView.centerX(inView: view)
        iconView.anchor(top:view.topAnchor,paddingTop: topMargin)
        
        signupLabelText.anchor(top:iconView.bottomAnchor, left:view.leftAnchor,paddingTop:20, paddingLeft: 16)
        
        credentialsInfoText.anchor(top:signupLabelText.bottomAnchor,left: view.leftAnchor,paddingTop:15, paddingLeft: 16)

        
        inputStackView.addArrangedSubview(usernameContainerView)
        inputStackView.addArrangedSubview(emailContainerView)
        inputStackView.addArrangedSubview(phoneNumberContainerView)
        inputStackView.addArrangedSubview(passwordContainerView)
        
        inputStackView.anchor(top:credentialsInfoText.bottomAnchor, left:view.leftAnchor,right: view.rightAnchor,paddingTop:24, paddingLeft:16, paddingRight:16)
        
        termsofServiceLabel.anchor(top:inputStackView.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 16,paddingLeft: 16,paddingRight: 16)
        
        buttonSigup.anchor(top:termsofServiceLabel.bottomAnchor, left:view.leftAnchor,right: view.rightAnchor,paddingTop: 24,paddingLeft:16, paddingRight: 16,height: 67)
        
        loginLabelStackView.addArrangedSubview(dontHaveAccountLabel)
        loginLabelStackView.addArrangedSubview(loginLabel)
        
        loginLabelStackView.centerX(inView: view)
        loginLabelStackView.anchor(top:buttonSigup.bottomAnchor,paddingTop: 16)
        
        self.passwordTextField.delegate = self
        self.passwordTextField.delegate = self
        self.usernameTextField.delegate = self
        self.phoneNumberTextField.delegate = self
        
    }
//MARK: selectors
    
    @objc func handleSignup(){
        
        guard let email = emailTextField.text else {return}
        guard let username = usernameTextField.text else {return}
        guard let phoneNumber = phoneNumberTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        let user = User(email: email, username: username, phoneNumber: phoneNumber, password: password)
        self.view.showProgress()
        
        DispatchQueue.global(qos: .background).async {
            AuthApiManager.shared.createUser(with: user) { [weak self] result  in
                switch result{
                case .success(_):
                    DispatchQueue.main.async {
                        self?.presentHomeScreen()
                        self?.view.hideProgress()
                    }
                  
                    
                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.view.hideProgress()
                        Toast.text(error.localizedDescription).show()
                    }
                }
                
           
            }
        }
    
    }
    
    func presentHomeScreen(){
        DispatchQueue.main.async {
            let navigationController = UINavigationController(rootViewController: HomeViewController())
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            appdelegate.window!.rootViewController = navigationController
        }
    }

}

extension SignUpViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
       // set the activeTextField to the selected textfield
       self.activeTextField = textField
     }
       
     // when user click 'done' or dismiss the keyboard
     func textFieldDidEndEditing(_ textField: UITextField) {
       self.activeTextField = nil
     }
}
