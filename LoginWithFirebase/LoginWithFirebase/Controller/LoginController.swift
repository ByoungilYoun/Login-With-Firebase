//
//  LoginController.swift
//  LoginWithFirebase
//
//  Created by 윤병일 on 2020/07/23.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginController : UIViewController {
  
  //MARK: - Properties
  
  private var viewModel = LoginViewModel() 
  
  private let iconImage = UIImageView(image: #imageLiteral(resourceName: "firebase-logo"))
  
  private let emailTextField = CustomTextField(placeholder: "Email")
  
  private let passwordTextField : CustomTextField = {
    let tf = CustomTextField(placeholder: "Password")
    tf.isSecureTextEntry = true
    return tf
  }()
  
  private let loginButton : AuthButton = {
    let button = AuthButton(type: .system)
    button.title = "Log In"
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    return button
  }()
  
  private let forgotPasswordButton : UIButton = {
    let button = UIButton(type: .system)
    let atts : [NSAttributedString.Key : Any] = [.foregroundColor : UIColor(white: 1, alpha: 0.87), .font : UIFont.boldSystemFont(ofSize: 15)]
    let attributedTitle = NSMutableAttributedString(string: "Forgot your password?",                                                    attributes: atts)
    let boldAtts : [NSAttributedString.Key : Any] = [.foregroundColor : UIColor(white: 1, alpha: 0.87), .font : UIFont.boldSystemFont(ofSize: 15)]
    attributedTitle.append(NSAttributedString(string: "Get help signing in.", attributes: boldAtts))
    button.setAttributedTitle(attributedTitle, for: .normal)
    button.addTarget(self, action: #selector(showForgotPassword), for: .touchUpInside)
    return button
  }()
  
  private let dividerView = DividerView()
  
  private let googleLoginButton : UIButton  = {
    let button = UIButton(type: .system)
    button.setImage(#imageLiteral(resourceName: "btn_google_light_pressed_ios").withRenderingMode(.alwaysOriginal), for: .normal)
    button.setTitle("  Log in with Google", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    button.addTarget(self, action: #selector(handleGoogleLogin), for: .touchUpInside)
    return button
  }()
  
  private let dontHaveAccountButton : UIButton = {
    let button = UIButton(type: .system)
    let atts : [NSAttributedString.Key : Any] = [.foregroundColor : UIColor(white: 1, alpha: 0.87), .font : UIFont.boldSystemFont(ofSize: 16)]
    let attributedTitle = NSMutableAttributedString(string: "Don't have an account",                                                    attributes: atts)
    let boldAtts : [NSAttributedString.Key : Any] = [.foregroundColor : UIColor(white: 1, alpha: 0.87), .font : UIFont.boldSystemFont(ofSize: 16)]
    attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: boldAtts))
    button.setAttributedTitle(attributedTitle, for: .normal)
    button.addTarget(self, action: #selector(showRegistrationController), for: .touchUpInside)
    return button
  }()
  
  
  //MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    configureNotificationObservers()
    configureGoogleSignIn()
  }
  //MARK: - Selectors
  
  @objc func handleLogin () {
    guard let email = emailTextField.text else {return}
    guard let password = passwordTextField.text else {return}
    
    Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
      if let error = error {
        print("Debug : Error signing in \(error.localizedDescription)")
        return
      }
      self.dismiss(animated: true, completion: nil)
      print("Debug : Successfully Logged in")
    }
  }
  
  @objc func showForgotPassword () {
   let controller = ResetPasswordController()
    navigationController?.pushViewController(controller, animated: true)
  }
  
  @objc func handleGoogleLogin() {
    GIDSignIn.sharedInstance()?.signIn()
  }
  
  @objc func showRegistrationController() {
    let controller = RegistrationController()
    navigationController?.pushViewController(controller, animated: true)
  }
  
  @objc func textDidChange(_ sender : UITextField) {
    if sender == emailTextField {
      viewModel.email = sender.text
    } else {
      viewModel.password = sender.text
    }
    
    updateForm()
  }
  //MARK: - Helpers
  
  func configureUI() {
    navigationController?.navigationBar.isHidden = true
    navigationController?.navigationBar.barStyle = .black
    
    configureGradientBackground()
    
    view.addSubview(iconImage)
    iconImage.centerX(inView: view)
    iconImage.setDimensions(height: 120, width: 120)
    iconImage.anchor(top : view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
    
    let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
    stack.axis = .vertical
    stack.spacing = 20
    
    view.addSubview(stack)
    stack.anchor(top : iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
    
    
    let stack2 = UIStackView(arrangedSubviews: [forgotPasswordButton, dividerView, googleLoginButton])
    stack2.axis = .vertical
    stack2.spacing = 28
    
    view.addSubview(stack2)
    stack2.anchor(top: stack.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingRight: 32)
    
    
    view.addSubview(dontHaveAccountButton)
    dontHaveAccountButton.centerX(inView: view)
    dontHaveAccountButton.anchor(bottom : view.safeAreaLayoutGuide.bottomAnchor)
  }
  
  func configureNotificationObservers() {
    emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
  }
  
  func configureGoogleSignIn() {
    GIDSignIn.sharedInstance()?.presentingViewController = self
    GIDSignIn.sharedInstance()?.delegate = self
  }
}

//MARK: - extension
extension LoginController : FormViewModel {
  func updateForm() {
    loginButton.isEnabled = viewModel.shouldEnableButton
    loginButton.backgroundColor = viewModel.buttonBackgroundColor
    loginButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
  }
}

extension LoginController : GIDSignInDelegate {
  func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
    print("Debug : Handle Google Sign In")
  }
  
  
}
