//
//  RNSRouteDetailViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRouteDetailViewController: UIViewController {
    
    var item: RNSRouteTable?
    
    var items: [RNSRouteTableItem] {
        return item?.items ?? []
    }
    
    static func initController(_ item: RNSRouteTable?) -> UIViewController?  {
        let vc = RNSRouteDetailViewController.initialController
        return vc
    }
    
    override class var storyboardName: String {
        return "RNSRouteDetailViewController"
    }
    
    deinit {
        print("RNSRouteDetailViewController deinit")
    }
}
