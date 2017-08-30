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
    
    @IBOutlet weak var blackButton: RNSBlackButton!
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
        
        
        prepareUI()
    }
    
    func prepareUI() {
        tableView.contentInset = UIEdgeInsetsMake(47, 0, 0, 0)
        prepareBlackButton()
    }
    
    func prepareBlackButton() {
        blackButton.handlerAction = { [weak self] in
            self?.showMoveMap()
        }
    }
    
    func showMoveMap() {
        RNSPageRouteManager.removeNonActivRoute()
        RNSMoveMapViewController.controller.pushAnimated()
    }
    
    override class var storyboardName: String {
        return "RNSRouteDetailController"
    }
    
    deinit {
        print("RNSRouteDetailViewController deinit")
    }
}
