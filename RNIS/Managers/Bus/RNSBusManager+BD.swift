//
//  RNSBusManager+Operation.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Экземпляр конроллера управления ТС для взаимодейтсвия с БД
 */
extension RNSBusManager {
    
    /// Функция обновления базы данных ТС
    static func updateBD() {
        RNSMoveBusManager.reset()
        if isNeedStopLoad {
            removeAll()
            return
        }
        prepareOperation(updateOperationBD)
    }
    
    /// Функция очереди обнволения БД
    static func updateOperationBD() {
        let uuids = RNSDataManager.bussUuids(lastMinCoord, center: lastCenterCoord)
        updateUuids(uuids)
    }
    
    /// Функция хранения ТС
    static func buss(_ uuids: [String]?) -> [RNSBus]? {
        return uuids?.flatMap({ (uuid) -> RNSBus? in
            return RNSDataManager.realm?.object(ofType: RNSBus.self, forPrimaryKey: uuid)
        })
    }
}
