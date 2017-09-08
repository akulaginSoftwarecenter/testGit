//
//  RNISAuthManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNISAuthManager {
     /**
     *  check have Token
     */
    static func checkToken() {
        if UserDefaults.token != nil {
            STRouter.showMenu()
        } else {
            STRouter.showLogin()
        }
    }
    
    static func logout() {
        STRouter.showLoader()
        RNSPostLogout { _, _, _ in
            STRouter.removeLoader()
            UserDefaults.removeToken()
            STRouter.showLogin()
        }
    }
}
