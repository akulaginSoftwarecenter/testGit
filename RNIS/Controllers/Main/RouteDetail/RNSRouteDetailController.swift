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
    
    @IBOutlet weak var detailView: RNSRouteDetailView!
    
    @IBOutlet weak var blackButton: RNSBlackButton!
    static func initController(_ item: RNSRouteTable?) -> UIViewController?  {
        let vc = RNSRouteDetailController.initialController as? RNSRouteDetailController
        vc?.item = item
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareBlackButton()
        detailView.item = item
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
