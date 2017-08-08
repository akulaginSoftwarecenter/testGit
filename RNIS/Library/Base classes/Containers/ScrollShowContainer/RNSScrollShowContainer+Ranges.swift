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
        return RNSRangeScroll(navOffset...topOffset) {
            self.scrollToTop()
        }
    }
    
    var rangeHalf: RNSRangeScroll {
        return RNSRangeScroll(startOffset...halfOffset)  {
            self.scrollToStart()
        }
    }
    
    var rangeThird: RNSRangeScroll {
        return RNSRangeScroll(almostOffset...startOffset){
            self.scrollToStart()
        }
    }
    
    var rangeBottom: RNSRangeScroll {
        return RNSRangeScroll(bottomOffset...almostOffset){
            self.dismiss()
         }
    }
}
