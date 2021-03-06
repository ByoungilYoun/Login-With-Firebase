//
//  ResetPasswordController.swift
//  LoginWithFirebase
//
//  Created by 윤병일 on 2020/07/25.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

protocol ResetPasswordControllerDelegate : class {
  func didSendResetPasswordLink()
}

class ResetPasswordController : UIViewController {
  //MARK: - Properties
  private var viewModel = ResetPasswordViewModel()
  weak var delegate : ResetPasswordControllerDelegate?
  var email : String?
  
  private let iconImage = UIImageView(image: #imageLiteral(resourceName: "firebase-logo"))
  private let emailTextField = CustomTextField(placeholder: "Email")
  
  private let resetPasswordButton : AuthButton = {
    let button = AuthButton(type: .system)
    button.title = "Send Reset Link"
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    button.addTarget(self, action: #selector(handleResetPassword), for: .touchUpInside)
    return button
  }()
  
  private let backButton : UIButton = {
    let button = UIButton(type: .system)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
    button.tintColor = .white
    button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
    return button
  }()
  //MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    configureNotificationObservers()
    loadEmail()
  }
  
  //MARK: - Selectors 
  @objc func handleResetPassword() {
    guard let email = viewModel.email else {return}
    
    showLoader(true)
    
    Service.resetPassword(forEmail: email) { error in
      self.showLoader(false)
      if let error = error {
        self.showMessage(withTitle: "Error", message: error.localizedDescription)
        return
      }
      
      self.delegate?.didSendResetPasswordLink()
    }
  }
  
  @objc func handleDismissal() {
    navigationController?.popViewController(animated: true)
  }
  
  @objc func textDidChange(_ sender : UITextField) {
    if sender == emailTextField {
      viewModel.email = sender.text
    } 
    updateForm()
  }
  
  
  //MARK: - Helpers
  
  func configure() {
    
    configureGradientBackground()
    
    view.addSubview(backButton)
    backButton.anchor(top : view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 16, paddingLeft: 16)
    
    view.addSubview(iconImage)
    iconImage.centerX(inView: view)
    iconImage.setDimensions(height: 120, width: 120)
    iconImage.anchor(top : view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
    
    let stack = UIStackView(arrangedSubviews: [emailTextField, resetPasswordButton])
    stack.axis = .vertical
    stack.spacing = 20
    
    view.addSubview(stack)
    stack.anchor(top : iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
  }
  
  func loadEmail () {
    guard let email = email else {return}
    viewModel.email = email
    emailTextField.text  = email
    
    updateForm()
  }
  
  func configureNotificationObservers() {
    emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
  }
}

//MARK: - extension
extension ResetPasswordController : FormViewModel {
  func updateForm() {
    resetPasswordButton.isEnabled = viewModel.shouldEnableButton
    resetPasswordButton.backgroundColor = viewModel.buttonBackgroundColor
    resetPasswordButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
  }
}
