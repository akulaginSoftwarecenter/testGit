//
//  RNSPostLogin.swift
//  RNIS
//
//  Created by Артем Кулагин on 20.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

class RNSPostLogin: RNSRequest {
    
    override var method: Alamofire.HTTPMethod {
        return .post
    }
    
    var login: String?
    var password: String?
    var complete: EmptyBlock?
    var failure: AliasStringBlock?
    
    typealias AliasModel = RNSRequestReply<RNSUserPayload,RNSLoginError>
    
    @discardableResult convenience init(_ login: String?, password: String?, complete: EmptyBlock?, failure: AliasStringBlock?) {
        self.init()
        
        self.login = login
        self.password = password
        self.complete = complete
        self.failure = failure
        
        sendRequestWithCompletion {[weak self] (object, error, inot) in
            if error != nil {
                failure?(kServerNotAviable)
                return
            }
            self?.parseReply(AliasModel(reply: object))
        }
    }
    
    func parseReply(_ model: AliasModel?) {
        if let payload = model?.payload,
            let token = payload.token,
            let uuid = payload.uuid {
            UserDefaults.setToken(token)
            UserDefaults.setUuid(uuid)
            complete?()
            return
        }
        parseError(model)
    }
    
    func parseError(_ model: AliasModel?) {
        guard let error = model?.errors?.first,
            var text = error.text else {
            return
        }
        
        if let loginError = error.data?.textError {
            text += ", " + loginError
        }
        failure?(text)
    }
    
    override var payload: AliasDictionary {
        guard let login = login,
        let password = password else {
            return [:]
        }
        return ["phone":login,
                "password":password]
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.mobile_user.login"
    }
}
