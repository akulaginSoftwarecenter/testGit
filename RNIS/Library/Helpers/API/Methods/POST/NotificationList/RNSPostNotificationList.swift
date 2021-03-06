//
//  RNSPostNotificationList.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Запрос получения списка нотификации
 */
class RNSPostNotificationList: RNSPostRequestMobileToken {
    
    typealias AliasReply = RNSRequestReply<RNSActionRoutingPayload<RNSNotificationModel>,RNSRegisterError>
    
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
    
    /// Метод расчета ошибки
    func parseError(_ model: AliasReply?, source: AnyObject) {
        guard let item = model?.errors?.first else {
            return
        }
        super.apiDidFailWithError(item.error)
    }
    
    override func showErrorNetwork() {
        
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.notification.list"
    }
}
