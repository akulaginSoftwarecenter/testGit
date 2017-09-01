//
//  RNSBusStopDetailController+Observe.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusStopDetailController {
    
    func prepareViews(_ rect: CGRect) {
        let y = rect.origin.y
        prepareAlpha(y)
        prepareTopTableView(y)
    }
    
    func prepareAlpha(_ top: CGFloat) {
        let alpha = Utils.alpha(top, startBottomOffset: startBottomOffset)
        titleLabel.alpha = alpha
        titleStop.alpha = alpha
        timerlabel.alpha = 1 - alpha
    }
    
    func prepareTopTableView(_ top: CGFloat) {
        let heightScreen = UIScreen.height
        let offset = heightScreen - top
        let between = offset - (startBottomOffset ?? 0)
        var constant = 74 + between
        if constant < 74 {
            constant = 74
        }
        if constant > 118 {
            constant = 118
        }
        topConstraint.constant = constant
    }
}
