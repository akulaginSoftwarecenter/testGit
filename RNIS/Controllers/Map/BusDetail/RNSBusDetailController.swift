//
//  RNSBusDetailController.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер показывает детальную информацию об автобусе
 */
class RNSBusDetailController: UIViewController {
    
    /// Создание контроллера
    ///
    /// - Parameter item: модель автобуса
    static func initController(_ item: RNSBus?) -> UIViewController? {
        let vc = RNSBusDetailController.initialController as? RNSBusDetailController
        vc?.itemBus = item
        
        let title = "Автобус №" + (item?.route_number ?? "")
        let container = STRouter.scrollShowContainer(vc, topTitle: title)
        container?.handlerRect = vc?.prepareViews(_:)
        container?.heightCoverButtonTop = 130
        container?.handlerDismiss = RNSMapManager.handlerDismissOldPresentVC
 
        vc?.startBottomOffset = container?.startBottomOffset
        let contentInsetBottom = CGFloat(80)
        container?.contentInsetBottom = contentInsetBottom
        if let bottomView = vc?.bottomView,
            let containerView = container?.view {
            containerView.addSubview(bottomView)
            bottomView.snp.makeConstraints({ (make) in
                make.bottom.left.right.equalTo(containerView)
                make.height.equalTo(contentInsetBottom)
            })
        }
        return  container
    }
    
    /// Представление с информацией о кондукторе
    let bottomView = RNSConductorView()
    
    /// Серверная модель автобуса
    var item: RNSBusTemp?
    /// Модель автобуса
    var itemBus: RNSBus?
    /// Начальное значение высоты контроллера
    var startBottomOffset: CGFloat?

    /// Представление, отображающее детальную информацию об автобусе
    @IBOutlet weak var viewTotal: RNSBusDetailTotalView!
    /// Представление, отображающее схему маршрута автобуса
    @IBOutlet weak var viewWay: RNSBusDetailWayView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItem()
    }
    
    /// Загрузка модели автобуса
    func loadItem() {
        STRouter.showLoader()
        RNSPostBusGet(itemBus) {[weak self] item in
            STRouter.removeLoader()
            self?.item = item
            self?.prepareItem()
        }
    }
    
    /// Настройка представлений
    func prepareItem() {
        viewTotal.item = item
        viewWay.item = item
        bottomView.item = item
    }
    
    override class var storyboardName: String {
        return "RNSBusDetailController"
    }
    
    deinit {
        print("RNSBusDetailController deinit")
    }
}
