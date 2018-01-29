//
//  RNSBusStopDetailController+Observe.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/// Расширение для обработки событий изменения фрейма представления контроллера
extension RNSBusStopDetailController {
    
    /// Настройка параметров представлений в зависимости от нового фрейма
    ///
    /// - Parameter rect: фрейм
    func prepareViews(_ rect: CGRect) {
        let y = rect.origin.y
        prepareAlpha(y)
        prepareTopTableView(y)
    }
    
    /// Настройка прозрачности представлений в зависимости от высоты фрейма
    ///
    /// - Parameter top: высота фрейма
    func prepareAlpha(_ top: CGFloat) {
        let alpha = Utils.alpha(top, startBottomOffset: startBottomOffset)
        titleLabel.alpha = alpha
        titleStop.alpha = alpha
        timerlabel.alpha = 1 - alpha
    }
    
    /// Обновление размеров таблицы
    ///
    /// - Parameter top: высота фрейма
    func prepareTopTableView(_ top: CGFloat) {
        let heightScreen = UIScreen.height
        let offset = heightScreen - top
        let between = offset - (startBottomOffset ?? 0)
        let topValue = CGFloat(18)
        var constant = topValue + between
        if constant < topValue {
            constant = topValue
        }
        
        if constant > 44 {
            constant = 44
        }
        topConstraint.constant = constant
    }
}
