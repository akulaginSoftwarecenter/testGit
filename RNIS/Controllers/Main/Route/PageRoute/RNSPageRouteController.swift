//
//  RNSPageRouteController.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPageRouteController: UIViewController {

    @IBOutlet weak var pageView: RNSPageRouteView!
    var containerController: RNSMapParentController?
    
    static func initController() -> UIViewController?  {
        return RNSPageRouteController.controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareMapView()
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
