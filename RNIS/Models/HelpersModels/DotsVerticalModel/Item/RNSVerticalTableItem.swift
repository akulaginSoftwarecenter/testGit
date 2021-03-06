//
//  VerticalTableItem.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Класс вертикальной точки
 */
class RNSVerticalTableItem: NSObject {
    var type: TypePoint? = .bus
    var title = ""
    var titleBus = ""
    var isEnd = false
    
    var isBus: Bool {
        return type == .bus
    }
    
    var isRun: Bool {
        return type == .run
    }
    
    /// Метод инициализации 
    convenience init(_ main: RNSRoutePoint?) {
        self.init()
        self.type = main?.type ?? .bus
        self.title = main?.title ?? ""
        self.titleBus = main?.route?.title ?? ""
    }
}
