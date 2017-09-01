//
//  RNSBusDetailController+Observe.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusDetailController {
    
    func prepareViews(_ rect: CGRect) {
        let y = rect.origin.y
        prepareAlpha(y)
        prepareEnabled(y)
    }
    
    func prepareAlpha(_ top: CGFloat) {
        let alpha = Utils.alpha(top, startBottomOffset: startBottomOffset)
        viewTotal.alpha = alpha
        viewWay.alpha = 1 - alpha
        bottomView.alpha = viewWay.alpha
    }
    
    func prepareEnabled(_ top: CGFloat) {
        let enabled = top > UIScreen.halfHeight
        viewTotal.isUserInteractionEnabled = enabled
        viewWay.isUserInteractionEnabled = !enabled
        bottomView.isUserInteractionEnabled = viewWay.isUserInteractionEnabled
    }
}
