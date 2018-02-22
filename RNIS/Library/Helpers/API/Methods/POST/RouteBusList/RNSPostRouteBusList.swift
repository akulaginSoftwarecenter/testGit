//
//  RNSPostRouteBusList.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.02.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class RNSPostRouteBusList: RNSRequest {
    override var method: Alamofire.HTTPMethod {
        return .post
    }
    
    typealias AliasReply = RNSRequestReply<RNSItemsPayload,RNSRegisterError>
    
    var item: RNSBusRouteTemp?
    var busStop: RNSBusStop?
    var complete: EmptyBlock?
    
    /// Метод инициализации 
    @discardableResult convenience init(_ item: RNSBusRouteTemp?, busStop: RNSBusStop?, complete: EmptyBlock?) {
        self.init()
        
        self.item = item
        self.busStop = busStop
        self.complete = complete
        sendRequestWithCompletion {[weak self] (object, error, inot) in
            self?.parseReply(AliasReply(reply: object))
        }
    }
    
    override var payload: AliasDictionary {
        guard let uuid = item?.uuid, let stop_point_uuid = busStop?.uuid else {
            return [:]
        }
        return [kUuid: uuid,
                kStop_point_uuid: stop_point_uuid]
    }

    func parseReply(_ model: AliasReply?) {
        complete?()
        if  model?.success ?? false,
            let item = model?.payload?.items?.first {
            let buss = RNSDataManager.parseItems([item]) as [RNSBus]
            RNSMapManager.showInfoIfNeed(buss.first)
            return
        } else {
            showError()
        }
        parseError(model)
    }
    
    func showError() {
        STAlertRouter.showOk("Для данного маршрута автобусы не найдены")
    }
    
    /// Метод расчета отображения ошибки
    func parseError(_ model: AliasReply?) {
        guard let item = model?.errors?.first else {
            return
        }
        let error = "Ошибка загрузки автобуса. " + item.textError
        STAlertRouter.showOk(error)
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.route.bus.list"
    }
}
