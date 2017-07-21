//
//  RNSBuildRouteView.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSBuildRouteView: BaseViewWithXIBInit {
    
    @discardableResult convenience init() {
        self.init(frame: CGRect.zero)
        
        animateShow()
    }
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
}
