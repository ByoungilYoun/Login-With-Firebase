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
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    return button
  }()
  //MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
  //MARK: - Selectors
  
  @objc func handleLogin () {
    print("Denug : Handle Login ")
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
  }
}
