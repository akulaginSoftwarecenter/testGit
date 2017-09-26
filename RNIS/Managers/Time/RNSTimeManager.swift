//
//  RNSTimeManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 26.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSTimeManager: NSObject {
    var timer: Timer!
    let distance = 17
    @discardableResult override init() {
        super.init()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        NotificationCenter.postTime()
    }
    
    deinit {
        timer.invalidate()
        timer = nil
    }
}
