//
//  RNSRouteTableItem+Still.swift
//  RNIS
//
//  Created by Артем Кулагин on 30.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRouteTableItem {
    
    var stillText: String? {
        if openStill {
            return text2
        } else {
            return text1
        }
    }
    
    var isStill: Bool {
        return type == .still
    }
    
    var countStill: Int {
        return itemsStill.count
    }
    
    func generateItemsStill() {
        itemsStill = [RNSRouteTableItem]()
        for index in 0...Int.rand(3, limit: 15) {
            let title = RNSBusStop.randTitle(index)
            let item = RNSRouteTableItem.genStop(title)
            itemsStill.append(item)
        }
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
