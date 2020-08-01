//
//  Constant.swift
//  LoginWithFirebase
//
//  Created by 윤병일 on 2020/07/29.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import Foundation
import Firebase

let MSG_METRICS = "Metrics"
let MSG_DASHBOARD = "Dashboard"
let MSG_NOTIFICATIONS = "Get Notified"

let MSG_ONBOARDING_METRICS = "Extract valuable insights and come up with data driven product initiatives to help grow your business"
let MSG_ONBOARDING_NOTIFICATIONS = "Get notified when important stuff is happening, so you don't miss out on the action"
let MSG_ONBOARDING_DASHBOARD = "Everything you need all in one place, available through our dashboard feature"

let DB_REF =  Database.database().reference()
let REF_USERS = DB_REF.child("users")

let MSG_RESET_PASSWORD_LINK_SENT = "We sent a link to your email to reset your password"
