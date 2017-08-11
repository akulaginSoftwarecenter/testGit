//
//  RNSBusDetailController+Observe.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusDetailController {

    var halfScreen: CGFloat {
        return UIScreen.halfHeight
    }
    
    func prepareViews(_ rect: CGRect) {
        let y = rect.origin.y
        prepareAlpha(y)
        prepareEnabled(y)
    }
    
    func prepareAlpha(_ top: CGFloat) {
        let alpha = self.alpha(top)
        viewTotal.alpha = alpha
        viewWay.alpha = 1 - alpha
    }
    
    func prepareEnabled(_ top: CGFloat) {
        let enabled = top > halfScreen
        viewTotal.isUserInteractionEnabled = enabled
        viewWay.isUserInteractionEnabled = !enabled
    }
    
    func alpha(_ top: CGFloat) -> CGFloat {
        let delta = halfScreen - (startBottomOffset ?? 0)
        let offset = top - halfScreen
        var alpha = offset/delta
        if alpha < 0 {
            alpha = 0
        }
        if alpha > 1 {
            alpha = 1
        }
        return alpha
    }
}
