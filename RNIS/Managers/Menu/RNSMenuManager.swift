//
//  RNSMenuManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSMenuManager: NSObject {
    static let shared = RNSMenuManager()
    
    static var menuItems: [MenuItem] {
        return shared.menuItems
    }
    
    lazy var menuItems = [MenuItem("Карта", RNSMapViewController.controller, #imageLiteral(resourceName: "menuMapIcon")),
                     MenuItem("Избранное", TransportViewController.initialController, #imageLiteral(resourceName: "menuStarIcon")),
                     MenuItem("Оповещения", NotificationsViewController.initialController, #imageLiteral(resourceName: "menuBellIcon")),
                     MenuItem("Новости", NewsViewController.initialController, #imageLiteral(resourceName: "menuNewspaperIcon")),
                     MenuItem("Настройки", nil, #imageLiteral(resourceName: "menuSettingsIcon")),
                     MenuItem("Стрелка", nil, #imageLiteral(resourceName: "menuCreditcardIcon")),
                     MenuItem("Информация", MainInfoViewController.initialController, #imageLiteral(resourceName: "menuInfoIcon"))]
    
    lazy var profileVC: UIViewController? = {
        return STRouter.redScrollContainer(RNSProfileViewController.initialController)
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
}
