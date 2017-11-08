//
//  RNSPinVariantEnd.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Пин конца одного из варинатов маршрута
 */
class RNSPinVariantEnd: RNSPinParent {
    
    /// Создание пина
    ///
    /// - Parameter item: точка маршрута
    @discardableResult convenience init(_ item: RNSRoutePoint?) {
        self.init()
        
        guard let item = item,
            let point = item.point else {
                return
        }
        setBitmap(#imageLiteral(resourceName: "PinEnd"), xOffset: 0, yOffset: -1.0, isPlain: false, sizeInMeters: 50)
        preparePoint(point)
        
        item.removeVariantEnd = { [weak self] in
            self?.remove()
        }
    }
}
