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
    
    @discardableResult convenience init(_ login: String?, password: String?, complete: EmptyBlock?, failure: AliasStringBlock?) {
        self.init()
        
        self.login = login
        self.password = password
        self.complete = complete
        self.failure = failure
        
        sendRequestWithCompletion {[weak self] (object, error, inot) in
            self?.parseReply(RNSRequestReply<RNSTokenPayload,RNSLoginError>(reply: object))
        }
    }
    
    func parseReply(_ model: RNSRequestReply<RNSTokenPayload,RNSLoginError>?) {
        if let token = model?.payload?.token {
            UserDefaults.setToken(token)
            complete?()
            return
        }
        parseError(model)
    }
    
    func parseError(_ model: RNSRequestReply<RNSTokenPayload,RNSLoginError>?) {
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
        return ["login":login,
                "password":password]
    }
    
    override var subject: String {
        return "com.rnis.auth.action.login"
    }
}
