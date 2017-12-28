//
//  RNSAddressViewController+Item.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.12.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSAddressViewController {
    
    func prepareItem() {
        addPinMapCenter(item?.point)
    }
    
    /// Настройка переменной, содержащей данные о расположении
    func updateItem() {
        if item == nil {
            item = RNSDutyAddressTemp()
        }
        item?.address = text
        let point = pin?.overlayItem.geoPoint
        item?.latitude = point?.latitude
        item?.longitude = point?.longitude
    }
    
    func prepareItemContainers(_ item: RNSAddressTemp?) {
        prepareAddressContainers(item?.name)
        addPinMapCenter(item?.point)
    }
    
    func clearPoint() {
        point = nil
    }
}
