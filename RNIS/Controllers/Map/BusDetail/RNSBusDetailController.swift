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
        vc?.item = RNSBusTemp.gen
        
        let title = "Автобус №" + (item?.title ?? "")
        let container = STRouter.scrollShowContainer(vc, topTitle: title)
        container?.handlerRect = vc?.prepareViews(_:)
        container?.heightCoverButtonTop = 130
 
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
    
    lazy var bottomView: UIView = RNSConductorView(self.item)
    
    var item: RNSBusTemp?
    var startBottomOffset: CGFloat?

    @IBOutlet weak var viewTotal: RNSBusDetailTotalView!
    @IBOutlet weak var viewWay: RNSBusDetailWayView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareItems()
    }
    
    func prepareItems() {
        viewTotal.item = item
        viewWay.item = item
    }
    
    override class var storyboardName: String {
        return "RNSBusDetailController"
    }
    
    deinit {
        print("RNSBusDetailController deinit")
    }
}
