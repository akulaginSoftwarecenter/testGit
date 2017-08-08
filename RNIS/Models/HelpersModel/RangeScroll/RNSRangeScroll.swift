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
    var handler: EmptyBlock?
    
    init(_ range: ClosedRange<CGFloat>, handler: EmptyBlock?) {
        self.range = range
        self.handler = handler
    }
}
