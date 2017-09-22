//
//  RNSDotsVerticalModel.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSDotsVerticalModel: NSObject {
    var items = [RNSVerticalTableItem]()
    
    var duration = "20 мин."
   
    var points: [RNSRoutePoint]?
    
    convenience init(_ main: RNSRouteVariant?) {
        self.init()
        
        self.points = main?.points
        prepareItems()
    }
}
