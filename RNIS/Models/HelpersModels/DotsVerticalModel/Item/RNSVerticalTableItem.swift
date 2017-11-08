//
//  VerticalTableItem.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

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
    
    convenience init(_ main: RNSRoutePoint?) {
        self.init()
        self.type = main?.type ?? .bus
        self.title = main?.stop_point?.name ?? ""
        self.titleBus = main?.route?.title ?? ""
    }
}
