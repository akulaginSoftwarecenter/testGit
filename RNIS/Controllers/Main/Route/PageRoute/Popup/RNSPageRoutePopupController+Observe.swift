//
//  RNSPageRoutePopupController+Observe.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 RNSPageRoutePopupController Observer extention
 */

extension RNSPageRoutePopupController {
    func prepareViews(_ rect: CGRect) {
        let y = rect.origin.y
        prepareAlpha(y)
        prepareEnabled(y)
    }
    
    func prepareAlpha(_ top: CGFloat) {
        let alpha = Utils.alpha(top, startBottomOffset: startBottomOffset)
        pageView.alpha = alpha
        containerView.alpha = 1 - alpha
    }
    
    func prepareEnabled(_ top: CGFloat) {
        let enabled = top > UIScreen.halfHeight
        pageView.isUserInteractionEnabled = enabled
        containerView.isUserInteractionEnabled = !enabled
    }
}
