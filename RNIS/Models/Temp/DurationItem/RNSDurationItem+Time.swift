//
//  RNSDurationItem+Time.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с временем
 */
extension RNSDurationItem {
    
    var timeRate: Int? {
        guard let durationDefault = durationDefault else {
            return nil
        }
        return Int(Double(durationDefault) * rateDistance)
    }
    
    func prepareTime(_ time: Int?) {
        self.durationDefault = time
        updateTimeDefault()
    }
    
    func updateTimeCurrent() {
       var timeRate = self.timeRate
        if (timeRate ?? 0) > (durationDefault ?? 0){
            timeRate = durationDefault
        }
        updateTime(timeRate)
    }
    
    func updateTimeDefault() {
        updateTime(durationDefault)
    }
    
    func updateTime(_ time: Int?) {
        if durationMinute != time {
            durationMinute = time
            updatePin()
        }
    }
}
