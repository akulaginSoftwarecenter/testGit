//
//  RNSMoveMapViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 30.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSMoveMapViewController: UIViewController {

    @IBOutlet weak var viewTop: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareMapView()
        prepareColor()
        
        prepareStub()
        preparePopup()
    }
    
    func preparePopup() {
        guard let containerVC = RNSMovePopupController.initController,
            let containerView = containerVC.view else {
                return
        }
        addChildViewController(containerVC)
        view.addSubview(containerView)
        containerView.autoPinEdgesToSuperviewEdges()
    }
    
    func prepareStub() {
        item?.points.first?.doneMove = true
        RNSPageRouteManager.prepareFirstNavel(523)
    }
    
    func prepareColor() {
        viewTop.backgroundColor = .backColor
    }
    
    var item: RNSRouteVariant? {
        return RNSPageRouteManager.currentItem
    }
    
    override class var storyboardName: String {
        return "RNSMapParentController"
    }
     
    deinit {
        RNSPageRouteManager.updateRoads()
        RNSPageRouteManager.prepareFirstNavel(nil)
    }
}
