//
//  RNSMovePopupController+Observe.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с анимацией внутреннего контроллера
 */
extension RNSMovePopupController {
    
    /// Обработка события изменения фрейма внутреннего контроллера
    ///
    /// - Parameter rect: новый фрейм внутреннего контроллера
    func prepareViews(_ rect: CGRect) {
        let y = rect.origin.y
        prepareAlpha(y)
        prepareEnabled(y)
    }
    
    /// Изменение прозрачности внутреннего контроллера в зависимости от высоты фрейма
    ///
    /// - Parameter top: высота фрейма
    func prepareAlpha(_ top: CGFloat) {
        let alpha = Utils.alpha(top, startBottomOffset: startBottomOffset)
        viewVariant.alpha = alpha
        containerView?.alpha = 1 - alpha
    }
    
    /// Изменение доступности представления внутреннего контроллера для касаний пользователя в зависимости от высоты его фрейма
    ///
    /// - Parameter top: высота фрейма
    func prepareEnabled(_ top: CGFloat) {
        let enabled = top > UIScreen.halfHeight
        buttonDown.isUserInteractionEnabled = enabled
        containerView?.isUserInteractionEnabled = !enabled
    }
}
