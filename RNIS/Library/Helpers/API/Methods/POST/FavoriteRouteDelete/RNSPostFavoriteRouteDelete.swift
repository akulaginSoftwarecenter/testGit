//
//  RNSPostFavoriteRouteDelete.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Запрос удаления избраного маршрута
 */
class RNSPostFavoriteRouteDelete: RNSPostRequestMobileToken {
    
    var route_number: String?
    var stop_point_uuid: String?
    var complete: EmptyBlock?
    
    typealias AliasReply = RNSRequestReply<RNISMappableBase,RNSRegisterError>
    
    /// Метод инициализации 
    @discardableResult convenience init(route_number: String? = nil, stop_point_uuid: String?, complete: EmptyBlock?) {
        self.init()
        
        self.route_number = route_number
        self.stop_point_uuid = stop_point_uuid
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
    
    /// Метод расчета отображения ошибки
    func parseError(_ model: AliasReply?) {
        guard let error = model?.errors?.first?.textError else {
            return
        }
        complete?()
        STAlertRouter.showOk(error)
    }
    
    override var payload: AliasDictionary {
        var dict = AliasDictionary()
        
        if let value = route_number {
            dict["route_number"] = value
        }
        
        if let value = stop_point_uuid {
            dict[kStop_point_uuid] = value
        }
        return dict
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.favorite_route.delete"
    }
}
