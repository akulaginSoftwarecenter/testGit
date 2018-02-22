//
//  RNSPostUpdate.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Запрос обновления данных пользователей
 */
class RNSPostUpdate: RNSPostRequestMobileToken {
    
    var item: RNSUserPayload?
    var failure: AliasStringBlock?
    var complete: AliasRegisterPayloadBlock?
    
    /// Метод инициализации 
    @discardableResult convenience init(_ item: RNSUserPayload?, enableSendToken: Bool = true, complete: AliasRegisterPayloadBlock?, failure: AliasStringBlock? = nil) {
        self.init()
        
        self.item = item
        self.failure = failure
        self.complete = complete
        self.enableSendToken = enableSendToken
        
        sendRequestWithCompletion {[weak self] (object, error, inot) in
            if error != nil {
                failure?(kServerNotAviable)
                return
            }

            self?.parseReply(AliasPostRegister(reply: object))
        }
    }
    
    func parseReply(_ model: AliasPostRegister?) {
        if  model?.success ?? false,
            let payload = model?.payload  {
            self.complete?(payload)
            return
        }
        parseError(model)
    }
    
    /// Метод расчета ошибки
    func parseError(_ model: AliasPostRegister?) {
        guard let error = model?.errors?.first?.textError else {
            return
        }
        failure?(error)
    }
    
    override var payload: AliasDictionary {
        guard let item = item else {
            return [:]
        }
        return item.toJSON()
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.mobile_user.update"
    }
}
