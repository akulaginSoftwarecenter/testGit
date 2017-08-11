//
//  RNSScrollShowContainer+Ranges.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSScrollShowContainer {
    
    var rangeNav: RNSRangeScroll {
        return RNSRangeScroll(navOffset...overTopOffset, handlerOne: {[weak self] in
            self?.scrollToTop()
        })
    }
    
    var rangeHalf: RNSRangeScroll {
        return RNSRangeScroll(startOffset...halfOffset, handlerOne: {[weak self] in
            self?.scrollToStart()
        })
    }
    
    var rangeThird: RNSRangeScroll {
        return RNSRangeScroll(almostOffset...startOffset, handlerOne: {[weak self] in
            self?.scrollToStart()
        })
    }
    
    var rangeBottom: RNSRangeScroll {
        return RNSRangeScroll(bottomOffset...almostOffset, handlerOne: { [weak self] in
            self?.dismiss()
         })
    }
    
    var rangeHalfTop: RNSRangeScroll {
        return RNSRangeScroll(halfOffset...(topOffset-2), handlerOne: { [weak self] in
            self?.scrollToTop()
            }, handlerTwo: { [weak self] in
                self?.scrollToStart()
        })
    }
    
    var rangeHalfAlmost: RNSRangeScroll {
        return RNSRangeScroll(almostOffset...halfOffset, handlerOne: { [weak self] in
            self?.scrollToTop()
            }, handlerTwo: { [weak self] in
                self?.dismiss()
        })
    }
    
    func checkRange(_ ranges: [RNSRangeScroll], complete: AliasRangeBlock?) {
        let offset = offsetY
        for item in ranges {
            if item.range.contains(offset) {
                complete?(item)
                return
            }
        }
    }
}
