//
//  RNSBuildRouteView.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

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
    
    func requestRoute() {
        RNSPOSTRouting(point)
    }
}
