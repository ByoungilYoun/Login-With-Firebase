//
//  RegistrationController.swift
//  LoginWithFirebase
//
//  Created by 윤병일 on 2020/07/25.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class RegistrationController : UIViewController {
  //MARK: - Properties
  
  private let iconImage = UIImageView(image: #imageLiteral(resourceName: "firebase-logo"))
  
  private let emailTextField = CustomTextField(placeholder: "Email")
  
  private let fullNameTextField = CustomTextField(placeholder: "Fullname")
  
  private let passwordTextField : CustomTextField = {
    let tf = CustomTextField(placeholder: "Password")
    tf.isSecureTextEntry = true
    return tf
  }()
  
  private let signUpButton : AuthButton = {
    let button = AuthButton(type: .system)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    button.title = "Sign Up"
    button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
    return button
  }()
  
  private let alreadyHaveAccountButton : UIButton = {
    let button = UIButton(type: .system)
    let atts : [NSAttributedString.Key : Any] = [.foregroundColor : UIColor(white: 1, alpha: 0.87), .font : UIFont.boldSystemFont(ofSize: 16)]
    let attributedTitle = NSMutableAttributedString(string: "Already have an account",                                                    attributes: atts)
    let boldAtts : [NSAttributedString.Key : Any] = [.foregroundColor : UIColor(white: 1, alpha: 0.87), .font : UIFont.boldSystemFont(ofSize: 16)]
    attributedTitle.append(NSAttributedString(string: "Log In", attributes: boldAtts))
    button.setAttributedTitle(attributedTitle, for: .normal)
    button.addTarget(self, action: #selector(showLoginController), for: .touchUpInside)
    return button
  }()
  //MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
  }
  
  //MARK: - Selectors
  
  @objc func handleSignUp() {
    
  }
  
  @objc func showLoginController() {
    navigationController?.popViewController(animated: true)
  }
  
  //MARK: - Helpers
  
  func configure() {
    let gradient = CAGradientLayer()
    gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
    gradient.locations = [0, 1]
    view.layer.addSublayer(gradient)
    gradient.frame = view.frame
    
    view.addSubview(iconImage)
    iconImage.centerX(inView: view)
    iconImage.setDimensions(height: 120, width: 120)
    iconImage.anchor(top : view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
    
    let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, fullNameTextField, signUpButton])
    stack.axis = .vertical
    stack.spacing = 20
    
    view.addSubview(stack)
    stack.anchor(top : iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
    
    view.addSubview(alreadyHaveAccountButton)
    alreadyHaveAccountButton.centerX(inView: view)
    alreadyHaveAccountButton.anchor(bottom : view.safeAreaLayoutGuide.bottomAnchor)
  }
}
