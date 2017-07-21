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
        
        show()
    }
    
    func show() {
        guard let view = STRouter.rootView else {
                return
        }
        view.addSubview(self)
        self.autoPinEdgesToSuperviewEdges()
        alpha = 0;
        UIView.animate(withDuration: 0.1) {[weak self] in
            self?.alpha = 1
            }
    }
    
    func remove() {
        removeFromSuperview()
    }
}
