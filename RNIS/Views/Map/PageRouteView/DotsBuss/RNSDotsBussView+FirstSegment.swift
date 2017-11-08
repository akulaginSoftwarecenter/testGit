//
//  RNSDotsBussView+FirstSegment.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSDotsBussView {
    
    var isHideFirstSegment: Bool {
        return buss.first?.doneMove ?? false
    }
    
    func prepareFirstSegment() {
        showFistSegment()
        hideFirstSegmentIfNeed()
    }
    
    func hideFirstSegmentIfNeed() {
        guard showMove,
            isHideFirstSegment else {
            return
        }
        hideFirstSegment()
    }
    
    func showFistSegment() {
        constraintSmallDots.constant = widthArraw
        dotsWhite.isHidden = false
        firstCircleWidth.constant = 15
        firstCircle.isHidden = false
    }
    
    func hideFirstSegment() {
        constraintSmallDots.constant = 0
        dotsWhite.isHidden = true
        firstCircleWidth.constant = 0
        firstCircle.isHidden = true
    }
}
