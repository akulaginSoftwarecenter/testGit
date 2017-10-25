//
//  RNSBusManager+Server.swift
//  RNIS
//
//  Created by Артем Кулагин on 26.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
import Alamofire
/**
 Экземпляр конроллера управления ТС для взаимодествия с сервером
 */
extension RNSBusManager {
    
    /// Функция обновления данных о ТС с сервера
    static func updateServer(complete: EmptyBlock?) {
        if isNeedStopLoad {
            removeAll()
            complete?()
            return
        }
        //CounterTime.startTimer()
        //updateBD()
        request?.cancel()
        request = RNSPostBusList(lastMinCoord, center: lastCenterCoord, complete: { (uuids) in
            //CounterTime.endTimer()
            updateOperationServer(uuids)
            complete?()
        })
    }
    
    /// Функция исполнения обновления данных о ТС с сервера
    static func updateOperationServer(_ uuids: [String]?) {
        prepareOperation {
            updateUuids(uuids)
        }
    }
}
