//
//  HomeController.swift
//  LoginWithFirebase
//
//  Created by 윤병일 on 2020/07/27.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit
import Firebase

class HomeController : UIViewController {
  
  //MARK: - Properties
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    authenticateUser()
    configure()
  }
  
  
  //MARK: - Selector
  @objc func handleLogout() {
    let alert = UIAlertController(title: nil, message: "Are you sure you want to log out?", preferredStyle: .actionSheet)
    alert.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { _ in
      self.logout()
    }))
    
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    present(alert, animated: true)
  }
  //MARK: - API
  fileprivate func presentLoginController() {
    let controller = LoginController()
    let navi = UINavigationController(rootViewController: controller)
    navi.modalPresentationStyle = .fullScreen
    self.present(navi, animated: true)
  }
  
  func authenticateUser() {
    if Auth.auth().currentUser?.uid == nil {
      DispatchQueue.main.async {
        self.presentLoginController()
        
      }
    } else {
      print("Debug : User is logged in")
    }
  }
  
  func logout() {
    do {
      try Auth.auth().signOut()
      self.presentLoginController()

    } catch {
      print("Debug : Error in signing out ")
    }
  }
  
  //MARK: - Helpers
  func configure() {
    configureGradientBackground()
    
    navigationController?.navigationBar.prefersLargeTitles  = true
    navigationController?.navigationBar.barStyle = .black
    navigationItem.title = "Firebase Login"
    
    let image = UIImage(systemName: "arrow.left")
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleLogout))
    navigationItem.leftBarButtonItem?.tintColor = .white
  }
}
