//
//  RNSPostNotificationUpdate.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPostNotificationUpdate: RNSPostRequestMobileToken {
    var item: RNSNotificationModel?
    var complete: EmptyBlock?
    
    typealias AliasReply = RNSRequestReply<RNISMappableBase,RNSRegisterError>
    
    /// Метод инициализации 
    @discardableResult convenience init(_ item: RNSNotificationModel?, complete: EmptyBlock?) {
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
    
    /// Метод расчета ошибки
    func parseError(_ model: AliasReply?) {
        guard let error = model?.errors?.first?.textError else {
            return
        }
        STAlertRouter.showOk(error)
    }
    
    override var payload: AliasDictionary {
        guard let item = item else {
            return [:]
        }
        return item.toJSON()
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.notification.update"
    }
}
