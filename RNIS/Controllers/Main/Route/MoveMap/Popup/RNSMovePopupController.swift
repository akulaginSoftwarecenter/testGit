//
//  RNSMovePopupController.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер представляет собой выдвигающееся снизу представление с детальной информацией о следовании по маршруту
 */
class RNSMovePopupController: UIViewController {
    
    /// Создание контроллера с помощью объекта содержащего информацию о маршруте
    ///
    /// - Parameter item: объект с информацией о маршруте
    static func initController(_ item: RNSRouteVariant?) -> UIViewController? {
        let vc = RNSMovePopupController.controller as? RNSMovePopupController
        vc?.item = item
        let container = RNSScrollShowContainer.initController(vc)
        
        container?.hideImageSlide = true
        container?.hideCoverBotton = true
        container?.allowHideBottom = false
        container?.heightTopView = 0
        container?.handlerRect = vc?.prepareViews(_:)
        container?.startBottomOffset = 75
        
        vc?.handlerDetailBack = {
            container?.scrollToStart()
        }
        vc?.startBottomOffset = container?.startBottomOffset
        
        return  container
    }
    
    /// Внутренний контроллер
    var containerController: RNSMoveDetailController?
    /// Блок, который вызывается при возврате из детального контроллера
    var handlerDetailBack: EmptyBlock?
    /// Начальная высота нижней панели
    var startBottomOffset: CGFloat?
    /// Объект с информацией о маршруте
    var item: RNSRouteVariant?
    
    /// Представление для отображения схемы движения
    @IBOutlet weak var viewVariant: RNSDotsBussView!
    /// Кнопка на схеме движения, которая открывает контроллер с детальной информацией
    @IBOutlet weak var buttonDown: UIButton!
    /// Контейнер для представления внутреннего контроллера
    @IBOutlet weak var containerView: UIView!
    
    var alert: RNSAlertViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareItem()
        prepareObservers()
    }
    
    override class var storyboardName: String {
        return "RNSMoveDetailController"
    }
    
    /// Событие нажатия на представление схемы маршрута
    @IBAction func actionDots(_ sender: Any) {
        let vc = RNSMoveDetailController.initController(item)
        vc?.handlerBack = {
            STRouter.pop()
        }
        vc?.pushAnimatedRed()
    }
    
    deinit {
        NotificationCenter.removeObserver(self)
    }
}
