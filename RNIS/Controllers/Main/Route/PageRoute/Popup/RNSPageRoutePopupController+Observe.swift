//
//  RNSPageRoutePopupController+Observe.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
Расширение для обработки события изменения фрейма внутреннего контроллера
 */
extension RNSPageRoutePopupController {
    
    /// Настройка анимации представлений
    ///
    /// - Parameter rect: прямоугольник нового фрейма
    func prepareViews(_ rect: CGRect) {
        let y = rect.origin.y
        prepareAlpha(y)
        prepareEnabled(y)
    }
    
    /// Настройка анимации прозрачности и сдвига сверху
    ///
    /// - Parameter top: сдвиг сверху
    func prepareAlpha(_ top: CGFloat) {
        let alpha = Utils.alpha(top, startBottomOffset: startBottomOffset)
        pageView.alpha = alpha
        containerView.alpha = 1 - alpha
    }
    
    /// Настройка представления пролистывающегося списка маршрутов и представления внутреннего контроллера
    ///
    /// - Parameter top: сдвиг сверху
    func prepareEnabled(_ top: CGFloat) {
        let enabled = top > UIScreen.halfHeight
        pageView.isUserInteractionEnabled = enabled
        containerView.isUserInteractionEnabled = !enabled
    }
}
