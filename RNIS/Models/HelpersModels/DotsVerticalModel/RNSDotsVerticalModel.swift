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
    var duration = String()
    var points: [RNSRoutePoint]?
    
    /// Метод инициализации 
    convenience init(_ main: RNSRouteVariant?) {
        self.init()
        
        self.points = main?.points
        self.duration = "\(main?.time ?? 0) мин."
        prepareItems()
    }
    
    var height: CGFloat {
        return CGFloat(48 + items.count * 52)
    }
}
