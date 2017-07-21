//
//  RNSPostLogin.swift
//  RNIS
//
//  Created by Артем Кулагин on 20.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPostLogin: PostRequest {
    
    @discardableResult override init() {
        super.init()
        
        STRouter.showLoader()
        sendRequest()
    }
    
    override var path: String {
        return serverRnisapi
    }
    
    override var parameters: [String : Any] {
        let headers = ["version": "1.0.0",
                       "requester": "ios",
                       "timestamp": ""]
        
        let payload = ["login":"admin",
                       "password":"password"]
        
        let dict = ["headers": headers,
                    "payload": payload]
        return dict
    }
    
    override func prepareURLRequest(_ request: URLRequest) -> URLRequest{
        var mutableRequest = super.prepareURLRequest(request)
        mutableRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options:[])
        mutableRequest.addValue("com.rnis.auth.action.login", forHTTPHeaderField: "Subject")
        return mutableRequest
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
        print("RNSPostLogin",token)
    }
    
    override func apiDidFailWithError(_ error: NSError) {
        removeLoader()
    }
    
    func removeLoader() {
        STRouter.removeLoader()
    }
}
