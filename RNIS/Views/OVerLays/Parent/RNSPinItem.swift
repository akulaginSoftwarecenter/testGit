//
//  RNSPinItem.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Расширенное представление пина на карте
 */
class RNSPinItem: RNSPinParent {
    
    /// модель географического положения пина
    var item: RNSCoordinateModel?
    
    /// Создание пина
    ///
    /// - Parameter item: географические координаты пина
    @discardableResult required init(_ item: RNSCoordinateModel) {
        super.init()
   
        self.item = item
        preparePoint()
        prepareImage()
        prepareHandlers()
    }
    
    func prepareImage() {
        
    }
    
    func preparePoint() {
        guard let point = item?.point else {
            return
        }
        preparePoint(point)
    }
    
    func prepareHandlers() {
        item?.handlerRemove = { [weak self] in
            self?.remove()
        }
    }
}
