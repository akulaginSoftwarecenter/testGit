//
//  RNSRabancManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.02.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Менеджер отображения маршрута автобуса
 */
class RNSRabancManager: NSObject {
    
    static var rabanc: RNSRabanc?
    
    static func prepareRabanc(_ value: Bool, item: RNSBusTemp?) {
        if value {
            showRabanc(item)
        } else {
            removeRabanc()
        }
    }
    
    static func showRabanc(_ item: RNSBusTemp?) {
        guard let json = Utils.dictToJson("rabanc") as? AliasDictionary else {
            return
        }
        rabanc = RNSRabanc(JSON: json)
    }
    
    static func removeRabanc() {
        //Отменяем запрос на маршрут
        rabanc?.clear()
        rabanc = nil
    }
}
