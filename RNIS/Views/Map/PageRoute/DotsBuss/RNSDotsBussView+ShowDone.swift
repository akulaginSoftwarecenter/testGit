//
//  RNSDotsBussView+ShowDone.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Dots Buss View + Show Done
 */

extension RNSDotsBussView {
    
    func prepareMoveIfNeed() {
        guard showMove else {
            return
        }
        prepareColorFirst()
        prepareColorEnd()
    }
    
    func prepareColorFirst() {
        if item?.points?.first?.doneMove ?? false {
            firstCircle.prepareDone()
            dotsWhite.prepareDone()
        }
    }
    
    func prepareColorEnd() {
        lastCircle.doneMove = doneMove
    }
    
    var doneMove: Bool {
        return item?.endDoneMove ?? false
    }
}
