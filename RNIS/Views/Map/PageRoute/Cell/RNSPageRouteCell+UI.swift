//
//  RNSPageRouteCell+.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

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
        guard let count = item?.buss.count else {
            return
        }
        var padeg: String
        if count == 1 {
            padeg = "пересадка"
        } else if (1...4).contains(count) {
            padeg = "пересадки"
        } else {
            padeg = "пересадок"
        }
        
        labelCount.text = "\(count) " + padeg
    }
}
