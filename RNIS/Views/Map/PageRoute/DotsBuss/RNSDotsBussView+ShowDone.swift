//
//  RNSDotsBussView+ShowDone.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

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
        lastCircle.done = doneMove
    }
    
    var doneMove: Bool {
        return lastCircle.done = item?.points?.last?.doneMove ?? false
    }
}
