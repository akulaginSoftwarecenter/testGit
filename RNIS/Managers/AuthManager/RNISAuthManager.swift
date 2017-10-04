//
//  RNISAuthManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNISAuthManager {
    
    static func logout() {
        STRouter.showLoader()
        RNSPostLogout { _, _, _ in
            STRouter.removeLoader()
            clearUserDefaults()
            RNSMenuManager.showMap()
            STRouter.showLogin(animated: false)
            RNSMenuManager.leftMenuUpdate()
            RNSMenuManager.handlerClearProfile?()
        }
    }
    
    static func clearUserDefaults() {
        UserDefaults.removeToken()
        UserDefaults.removeLogin()
        UserDefaults.removePassword()
    }
    
    static func login(_ login: String?, password: String?, failure: AliasStringBlock?) {
        STRouter.showLoader()
        RNSPostLogin(login, password: password, complete: {
            STRouter.removeLoader()
            STRouter.popToRoot()
            RNSMenuManager.leftMenuUpdate()
            }, failure: { (errorText) in
                STRouter.removeLoader()
                failure?(errorText)
        })
    }
}
