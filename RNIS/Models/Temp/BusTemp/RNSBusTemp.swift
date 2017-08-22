//
//  RNSBusTemp.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSBusTemp: RNISMappableBase, RNSTextItem  {
    var text: String?
    var title: String = ""
    
    static var generate: RNSBusTemp {
        let item = RNSBusTemp()
        item.title = "A" + "\(Int.rand(1, limit: 200))"
        return item
    }
    
    var titleWidth: CGFloat {
        return title.width(.cffazm20) + 22
    }
}
