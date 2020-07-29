//
//  User.swift
//  LoginWithFirebase
//
//  Created by 윤병일 on 2020/07/30.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import Foundation

struct User {
  let email : String
  let fullname : String
  let hasSeenOnboarding : Bool
  let uid : String
  
  init(uid : String, dictionary : [String : Any]) {
    self.uid = uid
    
    self.email = dictionary["email"] as? String ?? ""
    self.fullname = dictionary["fullname"] as? String ?? ""
    self.hasSeenOnboarding = dictionary["hasSeenOnboarding"] as? Bool ?? false
  }
}
