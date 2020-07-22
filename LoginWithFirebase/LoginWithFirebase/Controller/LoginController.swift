//
//  LoginController.swift
//  LoginWithFirebase
//
//  Created by 윤병일 on 2020/07/23.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class LoginController : UIViewController {
  
  private let iconImage = UIImageView(image: #imageLiteral(resourceName: "firebase-logo"))
  
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
  }
}
