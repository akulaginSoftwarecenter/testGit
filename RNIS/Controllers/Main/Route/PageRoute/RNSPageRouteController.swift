//
//  RNSPageRouteController.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер для отображения возможных маршрутов на карте с возможностью пролистывания
 */
class RNSPageRouteController: UIViewController {

    /// Внутренний контроллер
    var containerController: RNSMapParentController?
    
    /// Создание контроллера
    static func initController() -> UIViewController?  {
        return RNSPageRouteController.controller
    }
    
    /// Метод инициализации класса
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareMapView()
        preparePage()
    }
    
    /// Настройка представления, которое отображает пролистывающийся список маршрутов
    func preparePage() {
        guard let containerVC = RNSPageRoutePopupController.initController,
            let containerView = containerVC.view else {
                return
        }
        addChildViewController(containerVC)
        view.addSubview(containerView)
        containerView.autoPinEdgesToSuperviewEdges()
    }
    /// Переменная имени сториборда инициализации вьюконтроллера
    override class var storyboardName: String {
        return "RNSMapParentController"
    }
    
    deinit {
        RNSPageRouteManager.removeAllRoute()
        RNSPageRouteManager.items = nil
    }
}
