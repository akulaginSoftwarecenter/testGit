//
//  RNSMapParentController+LoadData.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMapParentController {
    
    /// Обновление положения автобусов на карте
    func busUpdate() {
        RNSBusManager.showLoader = true
        updateLoader()
        RNSBusManager.updateServer { [weak self] error in
           self?.showLoaderLostInet()
        }
    }
    
    /// Обновление автобусных остановок на карте
    func busStopUpdate() {
        RNSBusStopManager.showLoader = true
        updateLoader()
        RNSBusStopManager.updateServer ({ [weak self] in
            RNSBusStopManager.showLoader = false
            self?.updateLoader()
            }, failure: { [weak self] error in
                self?.showLoaderLostInet()
        })
    }
}
