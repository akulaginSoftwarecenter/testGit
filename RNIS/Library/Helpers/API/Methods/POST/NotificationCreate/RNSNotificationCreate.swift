//
//  RNSNotificationCreate.swift
//  RNIS
//
//  Created by IvanLazarev on 02/10/2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit


class RNSNotificationCreate: RNSPostRequestMobileToken {

    var bus: RNSBusRouteTemp?
    var stop: RNSBusStop?
    var time: String?
    var complete: EmptyBlock?

    typealias AliasReply = RNSRequestReply<RNISMappableBase,RNSRegisterError>

    /// Метод инициализации 
    @discardableResult convenience init(bus: RNSBusRouteTemp, stop: RNSBusStop, time: String?, complete: EmptyBlock?) {
        self.init()

        self.bus = bus
        self.stop = stop
        self.time = time
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
        guard let busUuid = bus?.uuid, let stopUuid = stop?.uuid, let time = time else {
            return [:]
        }
        return ["route_uuid" : busUuid, "route_number" : bus?.number ?? "", "stop_point" : ["uuid" : stopUuid, "name" : stop?.name ?? ""], "notification_time" : time]
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.notification.create"
    }
}
