//
//  RNSPinDuration.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Пин продолжительности следования
 */
class RNSPinDuration: RNSPinParent {
    
    /// Модель продолжительности следования
    var item: RNSDurationItem?
    
    /// Создание пина
    ///
    /// - Parameter item: модель продолжительности следования
    @discardableResult convenience init(_ item: RNSDurationItem?) {
        self.init()
        
        self.item = item
        guard let item = item,
            let point = item.point else {
                return
        }
        updateIcon()
        preparePoint(point)
        prepareHandlers()
    }
    
    /// Настройка обработчиков событий пина
    func prepareHandlers() {
        item?.handlerRemove = { [weak self] in
            self?.remove()
        }
        
        item?.handlerUpdate = { [weak self] in
            self?.updateIcon()
        }
        
        item?.handlerUpdateHide = { [weak self] in
            self?.updateIcon()
        }
    }
}
