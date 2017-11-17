//
//  RNSPostFavoriteRouteСreate.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPostFavoriteRouteCreate: RNSPostRequestMobileToken {
    
    var item: RNSBusRouteTemp?
    var complete: EmptyBlock?
    
    typealias AliasReply = RNSRequestReply<RNISMappableBase,RNSRegisterError>
    
    @discardableResult convenience init(_ item: RNSBusRouteTemp?, complete: EmptyBlock?) {
        self.init()
        
        guard let item = item else {
            return
        }
        self.item = item
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
        STAlertRouter.showAlertOk(error)
    }
    
    override var payload: AliasDictionary {
        guard let uuid = item?.uuid,
            let number = item?.number else {
            return [:]
        }
        return ["uuid": uuid,
                "route_number": number]
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.favorite_route.create"
    }
}
