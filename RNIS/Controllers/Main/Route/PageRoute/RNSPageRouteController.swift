//
//  RNSPageRouteController.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPageRouteController: UIViewController {

    var containerController: RNSMapParentController?
    
    static func initController() -> UIViewController?  {
        return RNSPageRouteController.controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareMapView()
        preparePage()
    }
    
    func preparePage() {
        guard let containerVC = RNSPageRoutePopupController.initController,
            let containerView = containerVC.view else {
                return
        }
        addChildViewController(containerVC)
        view.addSubview(containerView)
        containerView.autoPinEdgesToSuperviewEdges()
    }
    
    override class var storyboardName: String {
        return "RNSMapParentController"
    }
    
    deinit {
        RNSPageRouteManager.removeAllRoute()
        RNSPageRouteManager.items = nil
        print("RNSPageRouteController deinit")
    }
}
