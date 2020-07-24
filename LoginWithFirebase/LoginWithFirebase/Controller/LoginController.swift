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
  
  private let emailTextField : UITextField = {
    let tf = UITextField()
    
    let spacer = UIView()
    spacer.setDimensions(height: 50, width: 12)
    tf.leftView = spacer
    tf.leftViewMode = .always
    
    tf.borderStyle = .none
    tf.textColor = .white
    tf.backgroundColor = UIColor(white: 1, alpha: 0.1)
    tf.keyboardAppearance = .dark
    tf.setHeight(height: 50)
    tf.attributedPlaceholder = NSAttributedString(string: "Email",
                                                  attributes: [.foregroundColor : UIColor(white: 1.0, alpha: 0.7)])
    return tf
  }()
  
  private let passwordTextField : UITextField = {
    let tf = UITextField()
    
    let spacer = UIView()
    spacer.setDimensions(height: 50, width: 12)
    tf.leftView = spacer
    tf.leftViewMode = .always
    
    tf.borderStyle = .none
    tf.textColor = .white
    tf.isSecureTextEntry = true
    tf.backgroundColor = UIColor(white: 1, alpha: 0.1)
    tf.setHeight(height: 50)
    tf.keyboardAppearance = .dark
    tf.attributedPlaceholder = NSAttributedString(string: "Password",
                                                  attributes: [.foregroundColor : UIColor(white: 1.0, alpha: 0.7)])
    return tf
  }()
  
  //MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
  
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
    
    let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
    stack.axis = .vertical
    stack.spacing = 20
    
    view.addSubview(stack)
    stack.anchor(top : iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
  }
}
