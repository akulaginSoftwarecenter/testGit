//
//  RNSMenuManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
/**
 Контоллер управления боковым меню
 */
class RNSMenuManager: NSObject {
    
    /// Функция обновления бокового меню
    static var handlerLeftMenuUpdate: EmptyBlock?
    /// Функция обнволения меню "Стрелка"
    static var handlerStrelkaUpdate: EmptyBlock?
    /// Функция обнволения меню "Новости"
    static var handlerNewsUpdate: EmptyBlock?
    /// Функция обнволения меню "Избранное"
    static var handlerUpdateFavoriteBuss: EmptyBlock?
    /// Функция очистки данных профиля
    static var handlerClearProfile: EmptyBlock?
    
    static var handlerUpdateNotification: EmptyBlock?
    
    /// Создание экземпляра менеджера меню
    static let shared = RNSMenuManager()
    
    /// Создание экземпляра раздела меню
    static var menuItems: [MenuItem] {
        return shared.menuItems
    }
    
    /// Создание пунктов меню
    lazy var menuItems = [itemMap,
                     MenuItemFavorite(),
                     MenuItem(notificationTitle, NotificationsViewController.initialRed, #imageLiteral(resourceName: "menuBellIcon")),
                     MenuItem(kNews, NewsViewController.initialRed, #imageLiteral(resourceName: "menuNewspaperIcon")),
                     MenuItem("Настройки", SettingsViewController.initialRed, #imageLiteral(resourceName: "menuSettingsIcon")),
                     MenuItem( kStrelka, StrelkaViewController.initialRed, #imageLiteral(resourceName: "menuCreditcardIcon")),
                     MenuItem("Информация", MainInfoViewController.initialRed, #imageLiteral(resourceName: "menuInfoIcon"))]
    
    
    /// Создание "слабого" экзамплеряа контроллера профиля пользователя
    lazy var profileVC: UIViewController? = {
        return STRouter.imageScrollContainer(RNSProfileViewController.initialController)
    }()
    
    lazy var itemMap: MenuItem = {
        return MenuItem("Карта", self.mapVC, #imageLiteral(resourceName: "menuMapIcon"))
    }()
    
    lazy var itemProfile: MenuItem = {
        return MenuItem(nil, self.profileVC, nil)
    }()
    
    static var itemProfile: MenuItem {
        return shared.itemProfile
    }
    
    /// Создание "слабого" экзамплеряа контроллера карты
    lazy var mapVC: UIViewController? = {
        return RNSMapViewController.controller
    }()
    
    /// Блок отображения бокового меню
    static var handlerShowLeftMenu: EmptyBlock?
    /// Блок убирания бокового меню
    static var handlerHideLeftMenu: ((Bool) -> Void)?
    /// Блок выбранного контроллера меню
    static var handlerShowItem: ((MenuItem?) -> ())?
    
    /// Функция отображения бокового меню
    static func showLeftMenu() {
        handlerShowLeftMenu?()
    }

    /// Функция убирания бокового меню
    static func hideLeftMenu(animated: Bool) {
        handlerHideLeftMenu?(animated)
    }
    
    /// Функция отображения выбранного контроллера меню
    static func showItem(_ item: MenuItem?) {
        handlerShowItem?(item)
    }
    
    /// Функция показа первого пункта меню
    static func showFirst() {
        showItem(menuItems.first)
    }
    
    /// Фукнция показа профиля пользователя
    static func showProfile() {
        showItem(shared.itemProfile)
    }
    
    /// Фукнция обновления бокового меню
    static func leftMenuUpdate() {
        handlerLeftMenuUpdate?()
    }
    
    /// Функция обновления избранного
    static func updateFavoriteBuss() {
        handlerUpdateFavoriteBuss?()
    }
}
