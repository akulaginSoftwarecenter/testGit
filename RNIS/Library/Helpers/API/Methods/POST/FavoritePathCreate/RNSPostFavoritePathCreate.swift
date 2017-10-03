//
//  RNSPostFavoritePathCreate.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPostFavoritePathCreate: RNSPostRequestMobileToken {
    var item: RNSRouteVariant?
    var complete: AliasStringBlock?
    
    typealias AliasReply = RNSRequestReply<RNSFavoritePathCreatePayload,RNSRegisterError>
    
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
    
    func parseError(_ model: AliasReply?) {
        guard let error = model?.errors?.first?.textError else {
            return
        }
        complete?(nil)
        STRouter.showAlertOk(error)
    }
    
    override var payload: AliasDictionary {
        guard let dict = item?.dict,
            let name = item?.name else {
                return [:]
        }
        return ["data":dict, "name": name]
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.favorite_path.create"
    }
}
