//
//  RNSDotsVerticalModel.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSDotsVerticalModel: NSObject {
    var items = [RNSVerticalTableItem]()
    
    var duration = "20 мин."
    
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
        item3.type = .end
        item3.title = "ул. Коломяжский"
        items.append(item3)
        
        model.items = items
        return model
    }
}
