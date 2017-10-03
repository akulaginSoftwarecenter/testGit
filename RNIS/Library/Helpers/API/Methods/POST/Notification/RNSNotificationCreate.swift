//
//  RNSNotificationCreate.swift
//  RNIS
//
//  Created by IvanLazarev on 02/10/2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit


class RNSNotificationCreate: RNSPostRequestMobileToken {

    var busId: String?
    var stopId: String?
    var time: String?
    var complete: EmptyBlock?

    typealias AliasReply = RNSRequestReply<RNISMappableBase,RNSRegisterError>

    @discardableResult convenience init(_ busId: String?, stopId: String?, time: String?, complete: EmptyBlock?) {
        self.init()

        self.busId = busId
        self.stopId = stopId
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

    func parseError(_ model: AliasReply?) {
        guard let error = model?.errors?.first?.textError else {
            return
        }
        STRouter.showAlertOk(error)
    }

    override var payload: AliasDictionary {
        guard let busId = busId, let stopId = stopId, let time = time else {
            return [:]
        }
        return ["bus_id" : busId, "stop_id" : stopId, "notification_time" : time]
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.notification.create"
    }
}
