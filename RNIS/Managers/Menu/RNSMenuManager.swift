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
    static var handlerUpdateFavoriteBuss: EmptyBlock?
    
    static let shared = RNSMenuManager()
    
    static var menuItems: [MenuItem] {
        return shared.menuItems
    }
    
    lazy var menuItems = [MenuItem("Карта", mapVC, #imageLiteral(resourceName: "menuMapIcon")),
                     MenuItem("Избранное", TransportViewController.initialRed, #imageLiteral(resourceName: "menuStarIcon")),
                     MenuItem("Оповещения", NotificationsViewController.initialRed, #imageLiteral(resourceName: "menuBellIcon")),
                     MenuItem("Новости", NewsViewController.initialRed, #imageLiteral(resourceName: "menuNewspaperIcon")),
                     MenuItem("Настройки", SettingsViewController.initialRed, #imageLiteral(resourceName: "menuSettingsIcon")),
                     MenuItem( kStrelka, StrelkaViewController.initialRed, #imageLiteral(resourceName: "menuCreditcardIcon")),
                     MenuItem("Информация", MainInfoViewController.initialRed, #imageLiteral(resourceName: "menuInfoIcon"))]
    
    lazy var profileVC: UIViewController? = {
        return STRouter.imageScrollContainer(RNSProfileViewController.initialController)
    }()
    
    lazy var mapVC: UIViewController? = {
        return RNSMapViewController.controller
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
    
    static func showMap() {
        showVC(shared.mapVC)
    }
    
    static func leftMenuUpdate() {
        handlerLeftMenuUpdate?()
    }
    
    static func updateFavoriteBuss() {
        handlerUpdateFavoriteBuss?()
    }
}
