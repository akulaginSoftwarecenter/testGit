//
//  VerticalTableItem.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

enum TypeVerticalTable {
    case run, bus, end
}

class RNSVerticalTableItem: NSObject {
    var type: TypeVerticalTable = .bus
    var title = ""
    var titleBus = ""
    
    var isBus: Bool {
        return type == .bus
    }
    
    var isEnd: Bool {
        return type == .end
    }
    
    var isRun: Bool {
        return type == .run
    }
}
