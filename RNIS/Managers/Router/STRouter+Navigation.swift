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
    
    static func showAfterLogout() {
        showMapReset()
        showLogin(animated:false)
    }
    
    static func showMapReset() {
        RNSMenuManager.hideLeftMenu(animated: false)
        popToRootMain()
        RNSMenuManager.showMapToRoot()
        RNSMapManager.startLocation()
        RNSMapManager.hideOldPopopovers()
    }
 
    static func showLogin(animated: Bool = true) {
        guard let vc = RNSLoginEmailViewController.controller else {
            return
        }
        let container = imageBoardContainer(vc)
        STRouter.pushMain(container, animated: animated)
    }
    
    static func showSearch() {
        let vc = RNSSearchViewController.initialController
        let container = redContainer(vc)
        container?.pushAnimated()
    }
}
