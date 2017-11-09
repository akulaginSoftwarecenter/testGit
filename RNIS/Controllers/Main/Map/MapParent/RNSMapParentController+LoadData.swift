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
        showLoader("Обновление автобусов...")
        RNSBusManager.updateServer ({ [weak self] in
            self?.removeLoader()
            }, failure: { [weak self] error in
                self?.showLoaderLostInet()
        })
    }
    
    /// Обновление автобусных остановок на карте
    func busStopUpdate() {
        showLoader("Обновление остановок...")
        RNSBusStopManager.updateServer ({ [weak self] in
            self?.removeLoader()
            }, failure: { [weak self] error in
                self?.showLoaderLostInet()
        })
    }
}
