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
    
    func indexPatchs(_ indexPath: IndexPath) -> [IndexPath] {
        var indexPaths = [IndexPath]()
        for (index,_) in itemsStill.enumerated() {
            let patch = IndexPath(row: indexPath.row + 1 + index, section: 0)
            indexPaths.append(patch)
        }
        return indexPaths
    }
}
