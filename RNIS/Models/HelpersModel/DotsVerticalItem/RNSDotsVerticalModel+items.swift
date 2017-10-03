//
//  RNSDotsVerticalModel+items.swift
//  RNIS
//
//  Created by Артем Кулагин on 22.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSDotsVerticalModel {
    
    static func generate() -> RNSDotsVerticalModel {
        let model = RNSDotsVerticalModel()
        
        var items = [RNSVerticalTableItem]()
        let item1 = RNSVerticalTableItem()
        item1.type = .run
        item1.title = "ул. Культуры 1"
        items.append(item1)
        
        let item2 = RNSVerticalTableItem()
        item2.type = .bus
        item2.title = "ост. Адмирала-Макарова"
        item2.titleBus = "А86"
        items.append(item2)
        
        let item3 = RNSVerticalTableItem()
        //item3.type = .end
        item3.title = "ул. Коломяжский"
        items.append(item3)
        
        model.items = items
        return model
    }
    
    func prepareItems() {
        var items = [RNSVerticalTableItem]()
        
        guard let points = points,
            let first = points.first,
            let last = points.last else {
            return
        }
        items.append(first.verticalTableItem)
        
        var buss = [RNSBusRouteTemp]()
        for index in (1...(points.count - 1)) {
            if let point = points.valueAt(index), let bus = point.route, !buss.contains(bus) {
                buss.append(bus)
                items.append(point.verticalTableItem)
            }
        }
        let lastItem = last.verticalTableItem
        lastItem.isEnd  = true
        items.append(lastItem)
        self.items = items
    }
}
