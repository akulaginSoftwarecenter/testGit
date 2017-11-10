//
//  RNSRouteTableItem+Still.swift
//  RNIS
//
//  Created by Артем Кулагин on 30.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRouteTableItem {
    
    func indexPatchs(_ indexPath: IndexPath) -> [IndexPath] {
        var indexPaths = [IndexPath]()
        for (index,_) in itemsStill.enumerated() {
            let patch = IndexPath(row: indexPath.row + 1 + index, section: 0)
            indexPaths.append(patch)
        }
        return indexPaths
    }
    
    func prepareStill() {
        let item = self.copy() as? RNSRouteTableItem
        type = .still
        itemsStill = [RNSRouteTableItem]()
        appendStillItem(item)
        text2 = "Свернуть"
        text1 = "Еще \(countStill)"
        height = 60
    }
    
    func appendStillItem(_ item: RNSRouteTableItem?) {
        guard let item = item else {
            return
        }
        itemsStill.append(item)
    }
}
