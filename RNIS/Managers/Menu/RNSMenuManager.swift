//
//  RNSMenuManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSMenuManager: NSObject {
    
    static var handlerLeftMenuUpdate: EmptyBlock?
    static var handlerStrelkaUpdate: EmptyBlock?
    
    static let shared = RNSMenuManager()
    
    static var menuItems: [MenuItem] {
        return shared.menuItems
    }
    
    lazy var menuItems = [MenuItem("Карта", RNSMapViewController.controller, #imageLiteral(resourceName: "menuMapIcon")),
                     MenuItem("Избранное", TransportViewController.initialRed, #imageLiteral(resourceName: "menuStarIcon")),
                     MenuItem("Оповещения", NotificationsViewController.initialRed, #imageLiteral(resourceName: "menuBellIcon")),
                     MenuItem("Новости", NewsViewController.initialController, #imageLiteral(resourceName: "menuNewspaperIcon")),
                     MenuItem("Настройки", SettingsViewController.initialController, #imageLiteral(resourceName: "menuSettingsIcon")),
                     MenuItem( kStrelka, StrelkaViewController.initialController, #imageLiteral(resourceName: "menuCreditcardIcon")),
                     MenuItem("Информация", MainInfoViewController.initialRed, #imageLiteral(resourceName: "menuInfoIcon"))]
    
    lazy var profileVC: UIViewController? = {
        return STRouter.imageScrollContainer(RNSProfileViewController.initialController)
    }()
    
    static var handlerShowLeftMenu: EmptyBlock?
    static var handlerShowVC: ((UIViewController?) -> ())?
    
    static func showLeftMenu() {
        handlerShowLeftMenu?()
    }
    
    static func showVC(_ vc: UIViewController?) {
        handlerShowVC?(vc)
    }
    
    static func showFirst() {
        showVC(menuItems.first?.vc)
    }
    
    static func showProfile() {
        showVC(shared.profileVC)
    }
    
    static func leftMenuUpdate() {
        handlerLeftMenuUpdate?()
    }
}
