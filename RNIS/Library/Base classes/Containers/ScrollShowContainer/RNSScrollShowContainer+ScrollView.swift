//
//  RNSScrollShowContainer+Scroll.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSScrollShowContainer {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //print("scrollViewDidScroll",offsetY)
        moveOverTopIfNeed()
        prepareTouchView()
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        startOverTopDeselerate = ((topOffset+2)...10000000).contains(offsetY)
        detectSwipe()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        startOverTopDeselerate = false
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool){
        guard !decelerate else {
             return
        }
        checkRange(ranges) { range in
            range.handlerOne?()
        }
    }
    
    var offsetY: CGFloat {
        return scrollView.contentOffset.y
    }
}
