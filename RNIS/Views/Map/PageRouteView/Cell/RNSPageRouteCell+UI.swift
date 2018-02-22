//
//  RNSPageRouteCell+.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Page Route Cell+
 */
extension RNSPageRouteCell {
    
    func reloadData() {
        dotsBussView.item = item
        prepareDuration()
        prepareTime()
        prepareCount()
    }
    
    func prepareDuration() {
        guard let duration = item?.time else {
            return
        }
        labelDurations.text = "\(duration)"
    }
    
    func prepareTime() {
        guard let endDate = item?.endDate else {
            return
        }
        labelTime.text = endDate.stringHHmm
    }
    
    func prepareCount() {
        guard var count = item?.buss.count else {
            return
        }
        count -= 1
        
        var padeg: String
   
        if count <= 0 {
            padeg = "Без пересадок"
        } else if count == 1 {
            padeg = "\(count) пересадка"
        } else if (1...4).contains(count) {
            padeg = "\(count) пересадки"
        } else {
            padeg = "\(count) пересадок"
        }
        labelCount.text = padeg
    }
}
