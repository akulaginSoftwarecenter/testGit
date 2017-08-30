//
//  RNSRouteTable.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRouteTable: NSObject {
    
    var items = [RNSRouteTableItem]()
    var points: [RNSRoutePoint]?
    
    convenience init(_ main: RNSRouteVariant?) {
        self.init()
        
        self.points = main?.points
        prepareItems()
    }
}
