//
//  RNSBusTableModel+Items.swift
//  RNIS
//
//  Created by Артем Кулагин on 05.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusTableModel {
    
    func prepareItems() {
        guard let next_stop_point = main?.next_stop_point,
            let indCurrent = stop_points?.index(of: next_stop_point) else {
                return
        }
        
        addOnePart(indCurrent)
        addItemCurrent(indCurrent)
        addTwoPart(indCurrent)
    }
    
    func addOnePart(_ indCurrent: Int) {
        if indCurrent < 3 {
            addFirst()
            addItemDefRange(1..<indCurrent)
        } else {
            let beforeInd = indCurrent - 1
            let itemsStill = itemsRange(0..<beforeInd)
            itemsStill.first?.prepareStart()
            addItemStill("Предыдущие", itemsStill: itemsStill)
            addItemDef(beforeInd)
        }
    }
    
    func addTwoPart(_ indCurrent: Int) {
        let countAll = stop_points?.count ?? 0
        let indLast = countAll - 1
        if indCurrent == indLast {
            return
        }
        let count = indCurrent - indLast
        if count < 4 {
            addItemDefRange((indCurrent+1)..<indLast+1)
        } else {
            addItemDef(indCurrent+1)
            let itemsStill = itemsRange((indCurrent+2)..<(indLast - 1))
            addItemStill("Еще \(itemsStill.count)", itemsStill: itemsStill)
            addItemDef(indLast - 1)
            addItemDef(indLast)
        }
        prepareEnd()
    }
    
    func addFirst() {
        addItem(stop_points?.first, type: .start)
    }
    
    func prepareEnd() {
        items.last?.type = .end
    }
    
    func addItem(_ stop: RNSBusStopTemp?, type: TypeBusTableItem) {
        let item = RNSBusTableItem(stop, type: type)
        items.append(item)
    }
    
    func addItemDef(_ ind: Int?) {
        guard let ind = ind else {
            return
        }
        let item = RNSBusTableItem.itemDef(stop_points?.valueAt(ind))
        items.append(item)
    }
    
    func addItemDefRange(_ range: CountableRange<Int>) {
        for ind in range {
            addItemDef(ind)
        }
    }
    
    func addItemStill(_ title: String?, itemsStill: [RNSBusTableItem]) {
        let item = RNSBusTableItem.itemStill(title, itemsStill: itemsStill)
        items.append(item)
    }
    
    func itemsRange(_ range: CountableRange<Int>) -> [RNSBusTableItem] {
        var items = [RNSBusTableItem]()
        for ind in range {
            let item = RNSBusTableItem.itemDef(stop_points?.valueAt(ind))
            items.append(item)
        }
        return items
    }
    
    func addItemCurrent(_ ind: Int?) {
        guard let ind = ind else {
            return
        }
        let item = RNSBusTableItem(stop_points?.valueAt(ind), type: .current)
        items.append(item)
    }
}
