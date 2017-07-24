//
//  RNSPostLogin.swift
//  RNIS
//
//  Created by Артем Кулагин on 20.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPostLogin: RNSPostRequest {
    
    @discardableResult override init() {
        super.init()
        
        showLoader()
        sendRequest()
    }
    
    override var payload: AliasDictionary {
        return ["login":"admin",
                "password":"password"]
    }
    
    override var subject: String {
        return "com.rnis.auth.action.login"
    }

    override func apiDidReturnReply(_ reply: AnyObject, source: AnyObject){
        removeLoader()
        guard let model = RNSRequestReply<RNSTokenPayload>(reply: reply) else {
                superError()
                return
        }
        guard let token = model.payload?.token else {
            return
        }
        UserDefaults.setToken(token)
        STRouter.showMap()
        super.apiDidReturnReply(reply, source: source)
    }
}
