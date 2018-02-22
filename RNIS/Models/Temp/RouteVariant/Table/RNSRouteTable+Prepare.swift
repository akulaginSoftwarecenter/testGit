//
//  RNSRouteTable+Prepare.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для подготовки со стартовыми данными
 */
extension RNSRouteTable {
    
    func prepareEdge() {
        let first = items.first
        first?.edge = true
        first?.text1 = "Старт"
        first?.height = 80
        
        
        let last = items.last
        last?.edge = true
        last?.height = 33
        last?.showLine = false
    }
    
    func appendTotal() {
        let item = RNSRouteTableItem()
        item.text1 = "Итого: \(main?.time ?? 0) мин."
        item.type = .total
        items.append(item)
    }
    
    func prepareFirts() {
        items.first?.showTopBusLine = false
    }
    
    func prepareStillIfNeed() {
        if isLastStop {
            lastItem?.prepareStill()
        }
    }
}
