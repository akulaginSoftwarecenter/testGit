//
//  RNSPostFavoriteRouteDelete.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPostFavoriteRouteDelete: RNSPostRequestMobileToken {
    
    var route_number: String?
    var complete: EmptyBlock?
    
    typealias AliasReply = RNSRequestReply<RNISMappableBase,RNSRegisterError>
    
    @discardableResult convenience init(_ route_number: String?, complete: EmptyBlock?) {
        self.init()
        
        self.route_number = route_number
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
        guard let route_number = route_number else {
                return [:]
        }
        return ["route_number": route_number]
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.favorite_route.delete"
    }
}
