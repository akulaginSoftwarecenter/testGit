//
//  RNSRouteDetailViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRouteDetailController: UIViewController {
    
    var item: RNSRouteTable?
    
    @IBOutlet weak var tableView: UITableView!
    
    var items: [RNSRouteTableItem] {
        return item?.itemsStill ?? []
    }
    
    static func initController(_ item: RNSRouteTable?) -> UIViewController?  {
        let vc = RNSRouteDetailController.initialController as? RNSRouteDetailController
        vc?.item = item
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsetsMake(47, 0, 0, 0)
    }
    
    override class var storyboardName: String {
        return "RNSRouteDetailController"
    }
    
    deinit {
        print("RNSRouteDetailViewController deinit")
    }
}
