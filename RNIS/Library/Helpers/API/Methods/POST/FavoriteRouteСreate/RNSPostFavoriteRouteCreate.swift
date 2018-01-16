//
//  RNSPostFavoriteRouteСreate.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPostFavoriteRouteCreate: RNSPostRequestMobileToken {
    
    var busRoute: RNSBusRouteTemp?
    var stop_point: RNSBusStop?
    var complete: EmptyBlock?
    
    typealias AliasReply = RNSRequestReply<RNISMappableBase,RNSRegisterError>
    
    @discardableResult convenience init(_ busRoute: RNSBusRouteTemp?, stop_point: RNSBusStop?, complete: EmptyBlock?) {
        self.init()
        
        guard let busRoute = busRoute else {
            return
        }
        self.busRoute = busRoute
        self.stop_point = stop_point
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
        STAlertRouter.showOk(error)
    }
    
    override var payload: AliasDictionary {
        guard let stop_point_uuid = stop_point?.uuid,
            let route_number = busRoute?.number else {
            return [:]
        }
        return ["stop_point_uuid": stop_point_uuid,
                "route_number": route_number]
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.favorite_route.create"
    }
}
