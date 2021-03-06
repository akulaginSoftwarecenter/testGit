//
//  RNSPostFavoritePathCreate.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Запрос создания избраного маршрута
 */
class RNSPostFavoritePathCreate: RNSPostRequestMobileToken {
    /// главная переменная инициализации варианта маршрута
    var item: RNSRouteVariant?
    var complete: AliasStringBlock?
    
    typealias AliasReply = RNSRequestReply<RNSFavoritePathCreatePayload,RNSRegisterError>
    
    /// Метод инициализации 
    @discardableResult convenience init(_ item: RNSRouteVariant?, complete: AliasStringBlock?) {
        self.init()
        
        guard let item = item else {
            return
        }
        self.item = item
        self.complete = complete
        
        sendRequestWithCompletion {[weak self] (object, error, inot) in
            self?.parseReply(AliasReply(reply: object))
        }
    }
    
    func parseReply(_ model: AliasReply?) {
        if  model?.success ?? false,
            let uuid = model?.payload?.uuid {
            complete?(uuid)
            return
        }
        parseError(model)
    }
    
    /// Метод расчета отображения ошибки
    func parseError(_ model: AliasReply?) {
        guard let error = model?.errors?.first?.textError else {
            return
        }
        complete?(nil)
        STAlertRouter.showOk(error)
    }
    
    override var payload: AliasDictionary {
        guard let dict = item?.dict,
            let name = item?.name else {
                return [:]
        }
        var payload: AliasDictionary = ["data":dict, "name": name]
        if let uuid = item?.uuid {
            payload[kUuid] = uuid
        }
        return payload
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.favorite_path.create"
    }
}
