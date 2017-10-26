//
//  RNSRouteParentCel.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit


/// Базовая табличная ячейка для отображения информации о объектах на карте
class RNSRouteParentCell: RNSBaseTableCell {

    var showMove = false
    
    var item: RNSRouteTableItem? {
        didSet {
            prepareUI()
        }
    }
    
    let doneColor = UIColor.A3423C
    
    func prepareUI() {
        
        if showMove {
            prepareDone()
        }
    }
    
    func prepareDone() {
    
    }
    
    func prepareItem(_ item: RNSRouteTableItem?, showMove: Bool = false) {
        self.showMove = showMove
        self.item = item
    }
    
    var doneMove: Bool {
        return item?.doneMove ?? false
    }
}
