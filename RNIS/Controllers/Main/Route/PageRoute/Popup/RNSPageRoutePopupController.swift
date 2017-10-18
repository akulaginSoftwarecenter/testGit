//
//  RNSPageRoutePopupController.swift
//  RNIS
//
//  Created by Артем Кулагин on 20.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit


/**
 RNSPageRoutePopupController
 */

class RNSPageRoutePopupController: UIViewController {
    
    var containerController: RNSRouteDetailController?
    
    static var initController: UIViewController? {
        let vc = RNSPageRoutePopupController.controller as? RNSPageRoutePopupController
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
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pageView: RNSPageRouteView!
    
    var handlerDetailBack: EmptyBlock?
    var startBottomOffset: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareHanlders()
    }
    
    func prepareHanlders() {
        RNSPageRouteManager.handlerUpdateCurrentTwo = {[weak self] in
            self?.updateCurrentItem()
        }
    }
    
    override class var storyboardName: String {
        return "RNSRouteDetailController"
    }
}
