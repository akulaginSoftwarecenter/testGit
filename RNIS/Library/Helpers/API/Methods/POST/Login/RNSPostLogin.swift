//
//  RNSPostLogin.swift
//  RNIS
//
//  Created by Артем Кулагин on 20.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPostLogin: RNSPostRequest {

    var login: String?
    var password: String?
    
    @discardableResult convenience init(_ login: String?, password: String?, complete: EmptyBlock?, failure: AliasStringBlock?) {
        self.init()
        
        self.login = login
        self.password = password
        
        sendRequestWithCompletion { (object, error, inot) in
            print("RNSPostLogin Token",object)
            print("RNSPostLogin error",error)
            if let error = error {
                failure?(error.descriptionError)
                return
            }
            complete?()
        }
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

    override func apiDidReturnReply(_ reply: AnyObject, source: AnyObject){
        print("apiDidReturnReply",reply)
        guard let model = RNSRequestReply<RNSTokenPayload>(reply: reply) else {
                superError()
                return
        }
        guard let token = model.payload?.token else {
            return
        }
        UserDefaults.setToken(token)
        super.apiDidReturnReply(token as AnyObject, source: source)
    }
}
