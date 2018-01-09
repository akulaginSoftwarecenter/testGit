//
//  STRouter+Navigation.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

extension STRouter {

    static func showMenu() {
        RNSMenuViewController.initialController?.pushAnimated()
    }

    static func showLogin() {
        showLogin(animated: true)
    }

    static func showAfterLogout(animated: Bool) {
        guard let vc = loginVCAtBackShowMenu else {
            return
        }
        RNSMenuManager.itemMap.vc?.push(vc)
        RNSMenuManager.showMap()
    }

    static func showLogin(animated: Bool = true) {
        RNSLoginViewController.controller?.pushAnimatedImageBoard(animated: animated)
    }
    
    static var loginVCAtBackShowMenu: UIViewController? {
        let vc = RNSLoginViewController.controllerType()
        vc?.handlerBack = {
            RNSMenuManager.showLeftMenu()
        }
        return imageBoardContainer(vc)
    }
}
