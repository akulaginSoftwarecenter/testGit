//
//  RNSPageRoutePopupController.swift
//  RNIS
//
//  Created by Артем Кулагин on 20.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPageRoutePopupController: UIViewController {
    
    var containerController: RNSRouteDetailController?
    
    static var initController: UIViewController? {
        let vc = RNSPageRoutePopupController.controller as? RNSPageRoutePopupController
        let container = RNSScrollShowContainer.initController(vc)
        
        container?.hideImageSlide = true
        container?.hideCoverBotton = true
        container?.allowHideBottom = false
        container?.heightTopView = 0
        
        vc?.handlerDetailBack = {
            container?.scrollToStart()
        }
        /*
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
 */
        return  container
    }
    
    var handlerDetailBack: EmptyBlock?
    
    @IBOutlet weak var pageView: RNSPageRouteView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad RNSPageRoutePopupController")
    }
    
    override class var storyboardName: String {
        return "RNSRouteDetailController"
    }
}
