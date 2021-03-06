//
//  RNSBusManager+Stub.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
/**
 Экземпляр конроллера управления ТС для отображения теней ТС на карте
 */
extension RNSBusManager {
    
    /// Функция подготовки ассинхронного нанесения теней ТС на карте
    static func prepareStubAsunc() {
        removeOldAll()
        createStubItemsAsync { (items) in
            print("createBussAsync", items?.count as Any)
        }
    }
    
    /// Функция ассинхронного нанесения теней ТС на карте
    static func createStubItemsAsync(complete: AliasStringArrayBlock?) {
        RNSDataManager.removeAllBuss()
        //CounterTime.startTimer()
        createStubDicts { (dicts) in
            print("createStubDicts complete")
            //CounterTime.endTimer()
            RNSDataManager.parseBusItemsAsync(dicts, complete: { (items) in
                print("parseBusItemsAsync complete")
                //CounterTime.endTimer()
                complete?(items)
            })
        }
    }
    
    /// Функция создания словаря теней ТС на карте
    static func createStubDicts(complete: (([AliasDictionary]) -> ())?) {
        
        /// Словарь хранения теней на карте
        var dicts = [AliasDictionary]()
        
       // CounterTime.startTimer()
        /// Координата центра нанесение ТС на карту
        let point = redPlaceLocation.coordinate.point
        DispatchQueue.global(qos: .userInitiated).async {
            for index in 7...10000 {
                let lat = point.latitude - 0.2 + (Double(Int.rand(0, limit: 4000))/10000)
                let lon = point.longitude - 0.25 + (Double(Int.rand(0, limit: 5000))/10000)
                let number  = Int.rand(1, limit: 1000)
                dicts.append(["route_number":"\(number)",
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
