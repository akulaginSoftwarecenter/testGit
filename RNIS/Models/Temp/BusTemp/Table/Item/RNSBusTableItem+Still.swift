//
//  RNSBusTableItem+Still.swift
//  RNIS
//
//  Created by Артем Кулагин on 05.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusTableItem {
    
    var stillText: String? {
        if openStill {
            return "Свернуть"
        } else {
            return title
        }
    }
    
    var isStill: Bool {
        return type == .still
    }
    
    var countStill: Int {
        return itemsStill.count
    }
}
