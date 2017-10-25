//
//  RNSBusStopManager+.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
/**
 Экземпляр конроллера управления остановками ТС для взаимодейтсвия с БД
 */
extension RNSBusStopManager {
    
    /// Функция обновления базы данных остановок ТС
    static func updateBD() {
        prepareOperation(updateOperationBD)
    }
    
    /// Функция очереди обнволения БД
    static func updateOperationBD() {
        let uuids = RNSDataManager.bussStopsUuids(lastMinCoord, center: lastCenterCoord)
        updateUuids(uuids)
    }
    
    /// Функция хранения остановок ТС
    static func busStops(_ uuids: [String]?) -> [RNSBusStop]? {
        return uuids?.flatMap({ (uuid) -> RNSBusStop? in
            return RNSDataManager.realm?.object(ofType: RNSBusStop.self, forPrimaryKey: uuid)
        })
    }
}
