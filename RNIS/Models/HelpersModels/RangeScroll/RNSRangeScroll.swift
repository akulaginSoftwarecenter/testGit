//
//  RNSRangeScroll.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

struct RNSRangeScroll {
    
    var range: ClosedRange<CGFloat>
    var handlerOne: EmptyBlock?
    var handlerTwo: EmptyBlock?
    
    /// Метод инициализации 
    init(_ range: ClosedRange<CGFloat>, handlerOne: EmptyBlock? = nil, handlerTwo: EmptyBlock? = nil) {
        self.range = range
        self.handlerOne = handlerOne
        self.handlerTwo = handlerTwo
    }
}
