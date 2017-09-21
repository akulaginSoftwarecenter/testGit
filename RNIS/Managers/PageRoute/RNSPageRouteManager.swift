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
    static var handlerUpdateCurrentTwo: EmptyBlock?
    
    static var items: [RNSRouteVariant]? {
        didSet {
            updateAll(items?.first)
        }
    }
    
    static var currentItem: RNSRouteVariant?
    
    static var currentIndex: Int? {
        guard let currentItem = currentItem else {
            return nil
        }
        return items?.index(of: currentItem)
    }
     
    static func generateItems() {
        var items = [RNSRouteVariant]()
        items.append(RNSRouteVariant.genOne)
        items.append(RNSRouteVariant.genTwo)
        self.items = items
    }
    
    static func prepareFirstNavel(_ distance: CLLocationDistance?) {
        currentItem?.navels.first?.distance = distance
        currentItem?.updateNodes()
    }
}
