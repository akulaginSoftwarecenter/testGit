//
//  RNSDotsBussView+Values.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSDotsBussView {
    
    func prepareValues() {
        buss = item?.buss ?? []
        prepareBussShowMove()
        prepareWidthArraw()
    }
    
    func prepareBussShowMove() {
        guard showMove else {
            bussShowMove = buss
            return
        }
        
        var items = [RNSBusRouteTemp]()
        for item in buss.reversed() {
            items.insert(item, at: 0)
            if item.doneMove {
                break
            }
        }
        bussShowMove = items
    }
    
    func prepareWidthArraw() {
        let edge = CGFloat(66)
        var countBuss = CGFloat(bussShowMove.count)
        if !isHideFirstSegment {
            countBuss += 1
        }
        let betweens = CGFloat(3 * countBuss * 2)
        
        let titleWidthBuss = bussShowMove.titleWidth
        widthArraw = (UIScreen.width - edge - betweens - titleWidthBuss)/countBuss
    }
}
