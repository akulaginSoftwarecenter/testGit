//
//  RNSRouteVariant+Parse.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с парсером
 */
extension RNSRouteVariant {
    func prepareHashValue() {
        var hashValue = Int(0)
        for point in points ?? [] {
            hashValue += point.hashValue
        }
        self.hashValue = hashValue
    }
    
    func prepareEndDate() {
        time = points?.time
        endDate = Date().appendMinute(time ?? 0)
    }
    
    func setupNavels() {
        var navels = [RNSDurationItem]()
        var items = [RNSRoutePoint]()
        let addNavel: ([RNSRoutePoint]) ->() = {
            if let navel = $0.navel {
                navels.append(navel)
            }
        }
        for point in self.points ?? [] {
            if items.first?.different(point) ?? false {
                items.append(point)
                addNavel(items)
                items = [RNSRoutePoint]()
            }
            items.append(point)
        }
        addNavel(items)
        self.navels = navels
    }
}
