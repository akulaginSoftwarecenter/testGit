//
//  RNSBusManager+Uuids.swift
//  RNIS
//
//  Created by Артем Кулагин on 26.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
/**
 Экземпляр конроллера управления ТС для управления идентификаторами ТС
 */
extension RNSBusManager {
    
    /// Функция обновления идентификаторов ТС
    static func updateUuids(_ uuids: [String]?) {
        updateUuids(addUuids: addUuids(uuids), removeUuids: removeUuids(uuids))
    }
    
    /// Функция (расширенная) обновления идентификаторов ТС
    static func updateUuids(addUuids: [String]? = nil, removeUuids:[String]?) {
        Utils.mainQueue {
            removeOld(removeUuids)
            showPinsUuids(addUuids)
            showedUuids = showedItems.flatMap{$0.uuid}
            RNSMoveBusManager.updateUuids(showedUuids) // Временное обновление локации автобусов до введения сокетов
            //print("showedBuss",showedUuids.count, RNSMapManager.getZoomLevel)
        }
    }
    
    /// Функция удаления всех идентификаторов ТС
    static func removeAll() {
        updateUuids(removeUuids: showedUuids)
    }
    
    /// Функция добавления идентификаторов ТС
    static func addUuids(_ uuids: [String]?) -> [String]? {
        return uuids?.filter{!showedUuids.contains($0)}
    }
    
    /// Функция удаления  идентификаторов ТС
    static func removeUuids(_ uuids: [String]?) -> [String]? {
        guard let uuids = uuids else {
            return nil
        }
        return showedUuids.filter{ !uuids.contains($0) }
    }
}
