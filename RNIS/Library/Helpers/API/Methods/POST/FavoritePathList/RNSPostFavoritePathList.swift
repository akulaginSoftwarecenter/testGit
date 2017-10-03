//
//  RNSPostFavoritePathList.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPostFavoritePathList: RNSPostRequestMobileToken {
    
    typealias AliasReply = RNSRequestReply<RNSActionRoutingPayload,RNSRegisterError>
    
    override func apiDidReturnReply(_ reply: AnyObject, source: AnyObject){
        parseReply(AliasReply(reply: reply), source: source)
    }
    
    func parseReply(_ model: AliasReply?, source: AnyObject) {
        if  model?.success ?? false {
            super.apiDidReturnReply(model?.payload?.items as AnyObject, source: source)
            return
        }
        parseError(model, source: source)
    }
    
    func parseError(_ model: AliasReply?, source: AnyObject) {
        guard let item = model?.errors?.first else {
            return
        }
        super.apiDidFailWithError(item.error)
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.favorite_path.list"
    }
}