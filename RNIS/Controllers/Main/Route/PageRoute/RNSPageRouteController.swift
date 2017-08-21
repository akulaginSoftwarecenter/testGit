//
//  RNSPageRouteController.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPageRouteController: UIViewController {

    var items: [RNSRouteVariant]?
    
    @IBOutlet weak var pageView: RNSPageRouteView!
    
    static func initController(_ items: [RNSRouteVariant]?) -> UIViewController?  {
        let vc = RNSPageRouteController.controller as? RNSPageRouteController
        vc?.items = items
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageView.items = items
    }
    
    override class var storyboardName: String {
        return "RNSMapParentController"
    }
    
    deinit {
        print("RNSPageRouteController deinit")
    }
}
