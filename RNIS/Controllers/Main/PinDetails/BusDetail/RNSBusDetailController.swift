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
class RNSBusDetailController: RNSParentDetailPinController {
    
    /// Создание контроллера
    ///
    /// - Parameter item: модель автобуса
    static func initController(_ item: RNSBus?) -> UIViewController? {
        let vc = RNSBusDetailController.initialControllerType()
        vc?.itemBus = item
        
        let title = "Автобус №" + (item?.route_number ?? "")
        let container = STRouter.scrollShowContainer(vc, topTitle: title)
        container?.handlerRect = vc?.prepareViews(_:)
        container?.heightCoverButtonTop = 130
        container?.handlerDismiss = RNSMapManager.handlerDismissOldPresentVC
        container?.handlerShowStartComplete = {
            vc?.prepareWay()
        }
       
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
    
    lazy var loaderView = RNSLoaderWay()
    
    var canLoadViewWay = false
    
    /// Метод инициализации класса
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItem()
    }
    
    /// Загрузка модели автобуса
    func loadItem() {
        loaderView.showInView(view)
        RNSPostBusGet(itemBus, complete: {[weak self] item in
            self?.loaderView.remove()
            self?.item = item
            self?.prepareItem()
            }, failure: { [weak self] in
               self?.loaderView.prepareFailure()
        })
    }
    
    /// Настройка представлений
    func prepareItem() {
        viewTotal.item = item
        viewTotal.itemBus = itemBus
        bottomView.item = item
        prepareWayIfCan()
    }
    
    func prepareWayIfCan() {
        if canLoadViewWay {
            prepareWay()
        }
    }
    
    func prepareWay() {
        canLoadViewWay = true
        viewWay.item = item
    }
    
    override func prepareCurrent(_ value: Bool) {
        RNSBusManager.prepareCurrentItem(value, item: itemBus)
       // RNSRabancManager.prepareRabanc(value, item: nil)
    }
}
