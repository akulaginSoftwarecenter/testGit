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
        RNSMenuViewController.initialController.pushAnimated()
    }


    static func showLogin() {
        showLogin(animated: true)
    }

    static func showAfterLogout(animated: Bool) {
        guard let mapController = RNSMenuManager.shared.mapVC, let loginController = imageBoardContainer(RNSLoginViewController.controller) else {
            return
        }
        STRouter.rootViewController.setViewControllers([mapController, loginController], animated: animated)
    }

    static func showLogin(animated: Bool) {
        RNSLoginViewController.controller.pushAnimatedImageBoard(animated: animated)
    }
}
