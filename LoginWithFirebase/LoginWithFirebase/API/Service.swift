//
//  Service.swift
//  LoginWithFirebase
//
//  Created by 윤병일 on 2020/07/28.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import Foundation
import Firebase

typealias DatabaseCompletion = ((Error?, DatabaseReference) -> Void)

struct Service {
  static func logUserIn(withEmail email : String, password : String, completion : AuthDataResultCallback?) {
    Auth.auth().signIn(withEmail: email, password: password, completion: completion)
  }
  
  static func registerUserWithFirebase(withEmail email : String, password : String, fullname : String, completion : @escaping(DatabaseCompletion)) {
    Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
      if let error = error {
        print("Debug : Failed to create user with error : \(error.localizedDescription)")
        return
      }
      
      guard let uid = result?.user.uid else {return}
      
      let values = ["email" : email , "fullname" : fullname]
      
      Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock: completion)
    }
    
  }
  
  static func signInWithGoogle() {
    
  }
}
