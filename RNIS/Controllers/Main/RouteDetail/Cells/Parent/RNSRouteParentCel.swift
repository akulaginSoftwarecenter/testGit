//
//  RNSRouteParentCel.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRouteParentCell: RNSBaseTableCell {

    var item: RNSRouteTableItem? {
        didSet {
            prepareUI()
        }
    }
    
    func prepareUI() {
        
    }
}