//
//  RNSMovePopupController.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSMovePopupController: UIViewController {
    
    static var initController: UIViewController? {
        let vc = RNSMovePopupController.controller as? RNSMovePopupController
        let container = RNSScrollShowContainer.initController(vc)
        
        container?.hideImageSlide = true
        container?.hideCoverBotton = true
        container?.allowHideBottom = false
        container?.heightTopView = 0
        container?.handlerRect = vc?.prepareViews(_:)
        container?.startBottomOffset = 75
        
        vc?.handlerDetailBack = {
            container?.scrollToStart()
        }
        vc?.startBottomOffset = container?.startBottomOffset
        
        return  container
    }
    
    var containerController: RNSMoveDetailController?
    var handlerDetailBack: EmptyBlock?
    var startBottomOffset: CGFloat?
    
    @IBOutlet weak var viewVariant: RNSDotsBussView!
    @IBOutlet weak var buttonDown: UIButton!
    
    @IBOutlet weak var containerView: UIView!
    
    var item: RNSRouteVariant? {
        return RNSPageRouteManager.currentItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareItem()
    }
    
    func prepareItem() {
        viewVariant.item = item
    }
    
    override class var storyboardName: String {
        return "RNSMoveDetailController"
    }
    
    @IBAction func actionDots(_ sender: Any) {
        let vc = RNSMoveDetailController.initController(item)
        vc?.handlerBack = {
            STRouter.pop()
        }
        vc?.pushAnimatedRed()
    }
}
