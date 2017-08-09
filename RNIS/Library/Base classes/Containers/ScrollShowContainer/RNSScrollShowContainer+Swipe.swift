//
//  RNSScrollShowContainer+Swipe.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSScrollShowContainer {
    
    func detectSwipe() {
        let actualPosition = scrollView.panGestureRecognizer.translation(in: scrollView.superview)
        if (actualPosition.y > 0){
            swipeDownAction()
        }else{
            swipeUpAction()
        }
    }
    
    func swipeUpAction() {
        checkRangeSwipe { range in
            range.handlerOne?()
        }
    }
    
    func checkRangeSwipe(complete: AliasRangeBlock?) {
        checkRange(rangesSwipe, complete: complete)
    }
    
    func swipeDownAction() {
        checkRangeSwipe { range in
            range.handlerTwo?()
        }
    }
    
    func moveOverTopIfNeed() {
        if startOverTopDeselerate, offsetY < topOffset  {
             scrollToTop(false)
        }
    }
}
