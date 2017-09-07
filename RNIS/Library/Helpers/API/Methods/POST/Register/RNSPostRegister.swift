//
//  RNSPostRegister.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

class RNSPostRegister: RNSRequest {
    
    override var method: Alamofire.HTTPMethod {
        return .post
    }
    
    var phone: String?
    var password: String?
    var failure: AliasStringBlock?
    
    typealias AliasPostRegister = RNSRequestReply<RNSRegisterPayload,RNSRegisterError>
    
    @discardableResult convenience init(_ phone: String?, failure: AliasStringBlock?) {
        self.init()
        
        self.phone = phone
        self.failure = failure
        STRouter.showLoader()
        sendRequestWithCompletion {[weak self] (object, error, inot) in
            STRouter.removeLoader()
            self?.parseReply(AliasPostRegister(reply: object))
        }
    }
    
    func parseReply(_ model: AliasPostRegister?) {
        if let payload = model?.payload, payload.uuid != nil  {
            let vc = RNSRegistrationCodeController.initController(payload)
            STRouter.pushAnimatedImageBoard(vc)
            return
        }
        parseError(model)
    }
    
    func parseError(_ model: AliasPostRegister?) {
        guard let error = model?.errors?.first?.textError else {
             return
        }
        failure?(error)
    }
    
    override var payload: AliasDictionary {
        guard let phone = phone else {
                return [:]
        }
        return ["phone": "+7" + phone]
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.mobile_user.register"
    }
}
