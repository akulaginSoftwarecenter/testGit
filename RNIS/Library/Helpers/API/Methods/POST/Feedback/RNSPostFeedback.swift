//
//  RNSFeedbackPayload.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

/**
 Запрос создания избраного маршрута
 */
class RNSPostFeedback: RNSRequest {
    override var method: Alamofire.HTTPMethod {
        return .post
    }
    
    var complete: AliasComplete?
    var item: RNSFeedbackPayload?
    var failure: AliasStringBlock?
     
    typealias AliasPayload = RNSFeedbackPayload
    typealias AliasReply = RNSRequestReply<AliasPayload,RNSRegisterError>
    typealias AliasComplete = (AliasPayload?) -> ()
    
    /// Метод инициализации 
    @discardableResult convenience init(_ contact: String?, body: String?, complete: AliasComplete?, failure: AliasStringBlock? = nil) {
        self.init()
        
        self.item = RNSFeedbackPayload(contact, body: body)
        self.complete = complete
        self.failure = failure
        
        STRouter.showLoader()
        sendRequestWithCompletion {[weak self] (object, error, inot) in
            self?.checkError(error)
            STRouter.removeLoader()
            self?.parseReply(AliasReply(reply: object))
        }
    }
    
    func checkError(_ error: NSError?) {
        if error != nil {
            failure?(kServerNotAviable)
            return
        }
    }
    
    func parseReply(_ model: AliasReply?) {
        if  model?.success ?? false {
            complete?(model?.payload)
            return
        }
        parseError(model)
    }
    
    /// Метод расчета отображения ошибки
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
        return "com.rnis.mobile.action.feedback.send"
    }
}
