//
//  RNSPageRouteManager+Update.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSPageRouteManager {
    
    static func updateAll(_ currentItem: RNSRouteVariant?) {
        if self.currentItem == currentItem {
            return
        }
        updateMap(currentItem)
        handlerUpdateCurrent?()
    }
    
    static func updateMap(_ currentItem: RNSRouteVariant?) {
        if self.currentItem == currentItem {
            return
        }
        self.currentItem = currentItem
        
        updateRoads()
    }
    
    static func updateRoads() {
        prepareRoadsOff()
        currentItem?.prepareRoadActivate()
    }
}
