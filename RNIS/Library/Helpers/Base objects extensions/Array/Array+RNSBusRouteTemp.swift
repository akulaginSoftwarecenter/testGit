//
//  Array+RNSBusRouteTemp.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension Array where Element: RNSBusRouteTemp {
    
    var titleWidth: CGFloat {
        var width = CGFloat(0)
        for item in self {
            width += item.titleWidth
        }
        return width
    }
}
