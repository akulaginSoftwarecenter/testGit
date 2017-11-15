//
//  RNSBusStopManager+Server.swift
//  RNIS
//
//  Created by Артем Кулагин on 22.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
import Alamofire
/**
 Экземпляр конроллера управления остановками ТС для взаимодествия с сервером
 */
extension RNSBusStopManager {
    
    /// Функция обновления данных о ТС с сервера
    static func updateServer(_ complete: EmptyBlock?, failure: AliasStringBlock?) {
        request?.cancel()
        if isNeedStopLoad {
            removeAll()
            complete?()
            return
        }
        updateBD()
        let min = lastMinCoord
        let center = lastCenterCoord
        RNSStopRegionManager.checkCurrentRect(сontinue: {
            self.sendServer(min, center: center, complete: complete, failure: failure)
        }, failure: complete)
    }
    
    static func sendServer(_ min: PGGeoPoint, center: PGGeoPoint, complete: EmptyBlock?, failure: AliasStringBlock?) {
        self.request = RNSPostStopPointList(min, center: center, complete: { (uuids) in
            RNSStopRegionManager.add(min, center: center, complete: {
                self.updateOperationServer(uuids)
                complete?()
            })
        }, failure: failure)
    }
    
    /// Функция исполнения обновления данных о ТС с сервера
    static func updateOperationServer(_ uuids: [String]?) {
        prepareOperation {
            updateUuids(uuids)
        }
    }
}
