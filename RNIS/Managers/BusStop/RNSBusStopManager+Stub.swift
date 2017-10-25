//
//  RNSBusStopManager+Stub.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
/**
 Экземпляр конроллера управления остановками ТС для отображения теней остановок ТС на карте
 */
extension RNSBusStopManager {
    
    /// Функция подготовки нанесения теней остановок ТС на карте
    static func prepareStubBusStop() {
        //removeOldAll()
        RNSDataManager.createStubBusStopIfNeed()
        //showPinAll()
    }
    
    /// Функция подготовки ассинхронного нанесения теней остановок ТС на карте
    static func prepareStubAsunc() {
        removeOldAll()
        createStubItemsAsync { (items) in
            print("createStubBusStopAsync", items?.count as Any)
        }
    }
    
    /// Функция ассинхронного нанесения теней остановок ТС на карте
    static func createStubItemsAsync(complete: AliasStringArrayBlock?) {
        RNSDataManager.removeAllBusStop()
        //CounterTime.startTimer()
        createStubDicts { (dicts) in
            //CounterTime.endTimer()
            RNSDataManager.parseBusStopItemsAsync(dicts, complete: { (items) in
                //CounterTime.endTimer()
                complete?(items)
            })
        }
    }
    
    /// Функция создания словаря теней ТС на карте
    static func createStubDicts(complete: (([AliasDictionary]) -> ())?) {
        
        /// Словарь хранения теней на карте
        var dicts = [AliasDictionary]()
        
        //CounterTime.startTimer()
        /// Координата центра нанесение ТС на карту
        let point = RNSLocationManager.point
        DispatchQueue.global(qos: .userInitiated).async {
            for index in 7...10000 {
                let lat = point.latitude - 0.2 + (Double(Int.rand(0, limit: 4000))/10000)
                let lon = point.longitude - 0.25 + (Double(Int.rand(0, limit: 5000))/10000)
                
                dicts.append(["name":"test",
                              "uuid": "\(index)",
                    "latitude": lat,
                    "longitude" : lon])
            }
            Utils.mainQueue {
                complete?(dicts)
            }
        }
    }
}
