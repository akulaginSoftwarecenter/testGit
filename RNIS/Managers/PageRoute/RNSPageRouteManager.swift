//
//  RNSPageRoute.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPageRouteManager: NSObject {
    
    static var handlerUpdateCurrent: EmptyBlock?
    
    static var items: [RNSRouteVariant]? {
        didSet {
            currentItem = items?.first
        }
    }
    
    static var currentItem: RNSRouteVariant? {
        didSet{
            prepareCurrentItem()
        }
    }
    
    static func prepareCurrentItem() {
        handlerUpdateCurrent?()
        prepareRoadsOff()
        currentItem?.prepareRoadActivate()
    }
    
    static func generateItems() {
        var items = [RNSRouteVariant]()
        items.append(RNSRouteVariant.genOne)
        items.append(RNSRouteVariant.genTwo)
        self.items = items
    }
}
