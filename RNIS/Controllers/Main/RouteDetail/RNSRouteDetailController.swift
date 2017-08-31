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
    
    @IBOutlet weak var tableBottomConstraint: NSLayoutConstraint!
    
    var hiddenMoveButton = false
    
    @IBOutlet weak var blackButton: RNSBlackButton!
    @IBOutlet weak var tableView: UITableView!
    
    var items: [RNSRouteTableItem] {
        return item?.itemsStill ?? []
    }
    
    static func initController(_ item: RNSRouteTable?, hiddenMoveButton: Bool = false) -> UIViewController?  {
        let vc = RNSRouteDetailController.initialController as? RNSRouteDetailController
        vc?.item = item
        vc?.hiddenMoveButton = hiddenMoveButton
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
        
        blackButton.isHidden = hiddenMoveButton
        tableBottomConstraint.constant = hiddenMoveButton ? 0 : 87
        
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
