//
//  RNSScrollShowContainer+Scroll.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы со скролом
 */
extension RNSScrollShowContainer: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updatePositionTop()
        moveOverTopIfNeed()
        prepareTouchView()
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        startOverTopDeselerate = ((topOffset+2)...10000000).contains(offsetY)
        detectSwipe()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        startOverTopDeselerateFalse()
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool){
        guard !decelerate else {
             return
        }
        checkRange(ranges) { range in
            range.handlerOne?()
        }
    }
    
    func startOverTopDeselerateFalse() {
       startOverTopDeselerate = false
    }
    
    func prepareScrollView() {
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: contentInsetBottom, right: 0)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        if !completeFirstAnimation {
            completeFirstAnimation = true
            handlerShowStartComplete?()
        }
    }
    
    var offsetY: CGFloat {
        return scrollView.contentOffset.y
    }
}
