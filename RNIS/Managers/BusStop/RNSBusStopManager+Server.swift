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
        if isNeedStopLoad {
            removeAll()
            complete?()
            return
        }
        //CounterTime.startTimer()
        updateBD()
        request?.cancel()
        request = RNSPostStopPointList(lastMinCoord, center: lastCenterCoord, complete: { (uuids) in
            //CounterTime.endTimer()
            updateOperationServer(uuids)
            complete?()
        }, failure: failure)
    }
    
    /// Функция исполнения обновления данных о ТС с сервера
    static func updateOperationServer(_ uuids: [String]?) {
        prepareOperation {
            updateUuids(uuids)
        }
    }
}
