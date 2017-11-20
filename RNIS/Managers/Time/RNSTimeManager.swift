//
//  RNSTimeManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 26.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
/**
 Контроллер таймера
 */
class RNSTimeManager: NSObject {
    /// Создание экземпляра таймера
    var timer: Timer!
    /// Создание расстояния
    let distance = 17
    @discardableResult override init() {
        super.init()
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    /// Функция обновления таймера
    @objc func updateTime() {
        NotificationCenter.postTime()
        RNSBusManager.updateServer()  //Временное обновленее до введении сокетов
    }
    
    deinit {
        timer.invalidate()
        timer = nil
    }
}
