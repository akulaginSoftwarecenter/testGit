//
//  RNSPostNotificationList.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPostNotificationList: RNSPostRequestMobileToken {
    
    typealias AliasReply = RNSRequestReply<RNISMappableBase,RNSRegisterError>
    
    override func apiDidReturnReply(_ reply: AnyObject, source: AnyObject){
        parseReply(AliasReply(reply: reply), source: source)
    }
    
    func parseReply(_ model: AliasReply?, source: AnyObject) {
        if  model?.success ?? false {
            super.apiDidReturnReply(model?.payload as AnyObject, source: source)
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
        return "com.rnis.mobile.action.notification.list"
    }
}
