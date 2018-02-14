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
    var complete: EmptyBlock?
    
    @discardableResult convenience init(_ item: RNSBusRouteTemp?, complete: EmptyBlock?) {
        self.init()
        
        self.item = item
        self.complete = complete
        sendRequestWithCompletion {[weak self] (object, error, inot) in
            self?.parseReply(AliasReply(reply: object))
        }
    }
    
    override var payload: AliasDictionary {
        guard let uuid = item?.uuid else {
            return [:]
        }
        return [kUuid: uuid]
    }

    func parseReply(_ model: AliasReply?) {
       // print("RNSPostRouteBusList 1",model as Any)
        complete?()
        if  model?.success ?? false,
            let item = model?.payload?.items?.first {
          //  print("RNSPostRouteBusList 2",item)
            let buss = RNSDataManager.parseItems([item]) as [RNSBus]
          //  print("RNSPostRouteBusList 3",buss.first as Any)
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
