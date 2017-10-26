//
//  RNSBuildRouteView.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Представление для построения маршрута
 */
class RNSBuildRouteView: BaseViewWithXIBInit {
    
    var point: PGGeoPoint?
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    @discardableResult convenience init(_ point: PGGeoPoint?) {
        self.init(frame: CGRect.zero)
        
        self.point = point
        animateShow()
    }
   
    func remove() {
        RNSMapManager.removeOldPinBuild()
        self.removeFromSuperview()
    }
    
    var pointFrom: RNSDutyAddressTemp? {
        return RNSMapManager.pointFrom
    }
    var pointHere: RNSDutyAddressTemp? {
        return RNSMapManager.pointHere
    }
    
    func requestRoute() {
        STRouter.showLoader()
        RNSPostActionRouting(pointFrom, to: pointHere, complete: {[weak self] items in
            RNSPageRouteManager.items = items
            self?.showPageRoute()
            STRouter.removeLoader()
            self?.removeAnimate()
        }, failure: { [weak self] text in
            STRouter.showAlertOk(text)
            STRouter.removeLoader()
            self?.removeAnimate()
        })
    }
    
    func showPageRoute() {
        let vc = RNSDutyViewController.initialController as? RNSDutyViewController
        vc?.loadStartItems(pointFrom, inItem: pointHere)
        STRouter.redContainer(vc)?.push()
        RNSPageRouteController.controller.push()
    }
}
