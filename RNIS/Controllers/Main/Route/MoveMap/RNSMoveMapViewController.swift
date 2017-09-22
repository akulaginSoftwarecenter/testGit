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
    
    var handlerDidDisappear: EmptyBlock?
    var item: RNSRouteVariant?
    
    static func initController(_ item: RNSRouteVariant?) -> RNSMoveMapViewController? {
        let vc = RNSMoveMapViewController.controller as? RNSMoveMapViewController
        vc?.item = item
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareMapView()
        prepareColor()
        preparePopup()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        handlerDidDisappear?()
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
    
    func prepareColor() {
        viewTop.backgroundColor = .backColor
    }
    
    override class var storyboardName: String {
        return "RNSMapParentController"
    }
}
