//
//  MenuItem.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Класс ячейки бокового меню
 */
class MenuItem {
    
    /// корневой навигатор
    var vc: BaseNavigationController?
    
    /// Заголовок
    var title: String?
    
    /// Изображение
    var image: UIImage?
    
    /// Метод инициализации 
    init(_ title: String?, _ rootViewController: UIViewController?, _ image: UIImage?) {
        self.title = title
        if let rootViewController = rootViewController {
            self.vc = BaseNavigationController(rootViewController: rootViewController)
        }
        self.image = image
    }
    
    /// Метод появления
    func show() {
        updateIfNeed()
        RNSMenuManager.showItem(self)
    }
    
    /// Метод перехода к корневому контроллеру
    func popToRoot(completion: EmptyBlock? = nil) {
        vc?.popToRoot(completion: completion)
    }
    
    /// Метод обновления контроллеров если нужно
    func updateIfNeed() {
        if title == kStrelka {
            RNSMenuManager.handlerStrelkaUpdate?()
        }
        if title == kNews {
            RNSMenuManager.handlerNewsUpdate?()
        }
        
        if title == notificationTitle {
            RNSMenuManager.handlerUpdateNotification?()
        }
        updateIfExitsMoveMap()
    }
    
    /// Метод обновления контроллера движения
    func updateIfExitsMoveMap() {
        vc?.viewControllers.forEach{
            if let map = $0 as? RNSMoveMapViewController {
                map.prepareMapView()
            }
        }
    }
}
