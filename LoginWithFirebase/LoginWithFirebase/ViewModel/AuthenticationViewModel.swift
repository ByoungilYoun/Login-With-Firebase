//
//  AuthenticationViewModel.swift
//  LoginWithFirebase
//
//  Created by 윤병일 on 2020/07/26.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import Foundation

struct LoginViewModel {
  var email : String?
  var password : String?
  
  var formIsValid : Bool {
    return email?.isEmpty == false
      && password?.isEmpty == false 
  }
}

struct RegistrationViewModel {
  
}

struct ResetPasswordViewModel{
  
}
