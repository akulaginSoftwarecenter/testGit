//
//  RNSPostConfirmSend.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

class RNSPostConfirmSend: RNSRequest {
    
    override var method: Alamofire.HTTPMethod {
        return .post
    }
    
    var phone: String?
    
    typealias AliasPostRegister = RNSRequestReply<RNSRegisterPayload,RNSRegisterError>
    
    @discardableResult convenience init(_ phone: String?) {
        self.init()
        
        self.phone = phone
        STRouter.showLoader()
        sendRequestWithCompletion {[weak self] (object, error, inot) in
            STRouter.removeLoader()
            self?.parseReply(AliasPostRegister(reply: object))
        }
    }
    
    func parseReply(_ model: AliasPostRegister?) {
        if  model?.success ?? false {
            STRouter.showAlertRepeatCode()
            return
        }
        parseError(model)
    }
    
    func parseError(_ model: AliasPostRegister?) {
        guard let error = model?.errors?.first?.textError else {
            return
        }
        
        STRouter.showAlertOk(error)
    }
    
    override var payload: AliasDictionary {
        guard let phone = phone else {
            return [:]
        }
        return ["phone": phone]
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.mobile_user.confirm.send"
    }
}
