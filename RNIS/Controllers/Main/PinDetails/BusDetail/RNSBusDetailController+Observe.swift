//
//  RNSBusDetailController+Observe.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для вью
 */
extension RNSBusDetailController {
    /// Функция подготовки изменения вью
    func prepareViews(_ rect: CGRect) {
        let y = rect.origin.y
        prepareAlpha(y)
        prepareEnabled(y)
    }
    /// Функция подготовки изменения альфа канала
    func prepareAlpha(_ top: CGFloat) {
        let alpha = Utils.alpha(top, startBottomOffset: startBottomOffset)
        viewTotal.alpha = alpha
        viewWay.alpha = 1 - alpha
        bottomView.alpha = viewWay.alpha
    }
    /// Функция подготовки изменения включения вью
    func prepareEnabled(_ top: CGFloat) {
        let enabled = top > UIScreen.halfHeight
        viewTotal.isUserInteractionEnabled = enabled
        viewWay.isUserInteractionEnabled = !enabled
        bottomView.isUserInteractionEnabled = viewWay.isUserInteractionEnabled
    }
}
