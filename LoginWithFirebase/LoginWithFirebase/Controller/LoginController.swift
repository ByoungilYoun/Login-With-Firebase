//
//  LoginController.swift
//  LoginWithFirebase
//
//  Created by 윤병일 on 2020/07/23.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class LoginController : UIViewController {
  
  //MARK: - Properties
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
  }
  //MARK: - Selectors
  
  @objc func handleLogin () {
    print("Debug : Handle Login ")
  }
  
  @objc func showForgotPassword () {
    print("Debug : Handle ForgotPassword")
  }
  
  @objc func handleGoogleLogin() {
    print("Debug : Handle GoogleLogin")
  }
  
  @objc func showRegistrationController() {
    let controller = RegistrationController()
    navigationController?.pushViewController(controller, animated: true)
  }
  //MARK: - Helpers
  
  func configureUI() {
    navigationController?.navigationBar.isHidden = true
    navigationController?.navigationBar.barStyle = .black
    
    let gradient = CAGradientLayer()
    gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
    gradient.locations = [0, 1]
    view.layer.addSublayer(gradient)
    gradient.frame = view.frame
    
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
}
