//
//  RNSPostFavoritePathDelete.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPostFavoritePathDelete: RNSPostRequestMobileToken {
    var item: RNSRouteVariant?
    var complete: EmptyBlock?
    
    typealias AliasReply = RNSRequestReply<RNISMappableBase,RNSRegisterError>
    
    /// Метод инициализации 
    @discardableResult convenience init(_ item: RNSRouteVariant?, complete: EmptyBlock?) {
        self.init()
        
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
        STAlertRouter.showOk(error)
    }
    
    override var payload: AliasDictionary {
        guard let uuid = item?.uuid else {
            return [:]
        }
        return [kUuid: uuid]
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.favorite_path.delete"
    }
}
