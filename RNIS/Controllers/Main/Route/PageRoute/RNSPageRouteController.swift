//
//  RNSPageRouteController.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPageRouteController: UIViewController {

    var items: [Any]?
    
    static func initController(_ items: [Any]?) -> UIViewController?  {
        let vc = RNSPageRouteController.controller as? RNSPageRouteController
        vc?.items = items
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override class var storyboardName: String {
        return "RNSMapParentController"
    }
    
    deinit {
        print("RNSPageRouteController deinit")
    }
}
