//
//  RNSPageRoutePopupController.swift
//  RNIS
//
//  Created by Артем Кулагин on 20.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPageRoutePopupController: UIViewController {
    
    static var initController: UIViewController? {
        let vc = RNSPageRoutePopupController.controller as? RNSPageRoutePopupController

        let container = STRouter.scrollShowContainer(vc)
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

    
    @IBOutlet weak var pageView: RNSPageRouteView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageView.backgroundColor = .blue
        pageView.isHidden = false
        print("viewDidLoad RNSPageRoutePopupController")
    }
    
    override class var storyboardName: String {
        return "RNSRouteDetailController"
    }
}
