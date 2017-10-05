//
//  RNSBusDetailController.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSBusDetailController: UIViewController {
    
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
    
    let bottomView = RNSConductorView()
    
    var item: RNSBusTemp?
    var itemBus: RNSBus?
    var startBottomOffset: CGFloat?

    @IBOutlet weak var viewTotal: RNSBusDetailTotalView!
    @IBOutlet weak var viewWay: RNSBusDetailWayView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItem()
    }
    
    func loadItem() {
        STRouter.showLoader()
        RNSPostBusGet(itemBus) {[weak self] item in
            STRouter.removeLoader()
            self?.item = item
            self?.prepareItem()
        }
    }
    
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
