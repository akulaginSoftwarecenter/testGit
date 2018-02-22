//
//  RNSMoveMapViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 30.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер следования по маршруту
 */
class RNSMoveMapViewController: UIViewController {

    @IBOutlet weak var viewTop: UIView!
    
    /// Блок, который вызывается при исчезновении контроллера
    var handlerDidDisappear: EmptyBlock?
    /// Объект с информацией о маршруте
    var item: RNSRouteVariant?
    
    /// Создание контроллера
    ///
    /// - Parameter item: объект с информацией о маршруте
    static func initController(_ item: RNSRouteVariant?) -> RNSMoveMapViewController? {
        let vc = RNSMoveMapViewController.controllerType()
        vc?.item = item
        return vc
    }
    
    /// Метод инициализации класса
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareMapView()
        prepareColor()
        preparePopup()
        prepareObservers()
    }
    
    /// метод обработки появления контроллера
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        RNSMoveManager.isShowMoveMap = true
    }
    
    /// метод обработки исчезновения контроллера
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        moveMapFalse()
    }
    
    /// Обновление объекта с информацией о маршруте
    @objc func updateItem() {
        item?.updateDistanceNavels()
    }
    
    /// Контроллер подписывается на получение уведомлений
    func prepareObservers() {
        NotificationCenter.addObserverLocation(self, selector: #selector(updateItem))
    }
    
    /// Настройка внутреннего контроллера
    func preparePopup() {
        guard let containerVC = RNSMovePopupController.initController(item),
            let containerView = containerVC.view else {
                return
        }
        addChildViewController(containerVC)
        view.addSubview(containerView)
        containerView.autoPinEdgesToSuperviewEdges()
    }
    
    func prepareColor() {
        viewTop.backgroundColor = .backColor
    }
    
    func prepareStubLocation(_ location: CLLocation?) {
        stubLocation = location
        RNSLocationManager.updateLocation()
    }
    
    func showAlertExit(_ handler: EmptyBlock?) {
        RNSMoveManager.showAlertExit(handler)
    }
    
    deinit {
        closeItem()
        
        handlerDidDisappear?()
        
        prepareStubLocation(nil)
        NotificationCenter.removeObserver(self)
        moveMapFalse()
    }
    
    override class var storyboardName: String {
        return "RNSMapParentController"
    }
    
    func moveMapFalse() {
        RNSMoveManager.isShowMoveMap = false
    }
}
