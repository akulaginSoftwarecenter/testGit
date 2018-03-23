//
//  RNSPostNotificationDelete.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
/**
 Запрос удаления нотификации
 */
class RNSPostNotificationDelete: RNSPostRequestMobileToken {
    /// переменная уникальный идентификатор сущности
    var uuid: String?
    var bus: RNSBusRouteTemp?
    var stop: RNSBusStop?
    var complete: EmptyBlock?
    
    typealias AliasReply = RNSRequestReply<RNISMappableBase,RNSRegisterError>
    
    /// Метод инициализации 
    @discardableResult convenience init(_ uuid: String? = nil, bus: RNSBusRouteTemp? = nil, stop: RNSBusStop? = nil, complete: EmptyBlock?) {
        self.init()
        
        self.uuid = uuid
        self.bus = bus
        self.stop = stop
        self.complete = complete
        
        sendRequestWithCompletion {[weak self] (object, error, inot) in
            complete?()
            self?.parseReply(AliasReply(reply: object))
        }
    }
    
    func parseReply(_ model: AliasReply?) {
        if  model?.success ?? false {
            return
        }
        parseError(model)
    }
    
    /// Метод расчета ошибки
    func parseError(_ model: AliasReply?) {
        guard let error = model?.errors?.first?.textError else {
            return
        }
        STAlertRouter.showOk(error)
    }
    
    override var payload: AliasDictionary {
         var dict = AliasDictionary()
        if let uuid = uuid {
            dict = [kUuid: uuid]
        }
        if let busUuid = bus?.uuid, let stopUuid = stop?.uuid  {
            dict["route_uuid"] = busUuid
            dict["route_number"] = bus?.number ?? ""
            dict["stop_point"] = ["uuid" : stopUuid, "name" : stop?.name ?? ""]
        }
        return dict
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.notification.delete"
    }
}
