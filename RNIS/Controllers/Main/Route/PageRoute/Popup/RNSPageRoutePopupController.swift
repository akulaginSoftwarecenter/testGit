//
//  RNSPageRoutePopupController.swift
//  RNIS
//
//  Created by Артем Кулагин on 20.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit


/**
 Контроллер представляет собой выдвигающуюся снизу панель с детальной информацией о маршруте и возможностью пролистывания
 */
class RNSPageRoutePopupController: UIViewController {
    
    /// Внутренний контроллер
    var containerController: RNSRouteDetailController?
    
    /// Создание контроллера
    static var initController: UIViewController? {
        let vc = RNSPageRoutePopupController.controllerType()
        let container = RNSScrollShowContainer.initController(vc)
        
        container?.hideImageSlide = true
        container?.hideCoverBotton = true
        container?.allowHideBottom = false
        container?.heightTopView = 0
        container?.handlerRect = vc?.prepareViews(_:)
        
        vc?.handlerDetailBack = {
            container?.scrollToStart()
        }
        vc?.startBottomOffset = container?.startBottomOffset
        return  container
    }
    /// Контейнер для представления внутреннего контроллера
    @IBOutlet weak var containerView: UIView!
    /// Представление, которое отображает информацию о возможных маршрутах с возможностью пролистывания
    @IBOutlet weak var pageView: RNSPageRouteView!
    
    /// Блок, который выполнится после нажатия на кнопку возврата во внутреннем контроллере
    var handlerDetailBack: EmptyBlock?
    /// Начальная высота нижней панели
    var startBottomOffset: CGFloat?
    
    /// Метод инициализации класса
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareHanlders()
    }
    
    /// Настройка обработчиков
    func prepareHanlders() {
        RNSPageRouteManager.handlerUpdateCurrentTwo = {[weak self] in
            self?.updateCurrentItem()
        }
    }
    
    override class var storyboardName: String {
        return "RNSRouteDetailController"
    }
}
