//
//  RNSPostLogin.swift
//  RNIS
//
//  Created by Артем Кулагин on 20.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPostLogin: PostRequest {
    
    override var path: String {
        return serverRnisapi
    }
    /*
    override var parameters: [String : Any] {
        let headers = ["version": "1.0.0",
                       "requester": "web",
                       "timestamp": ""]
        
        let payload = ["login":"admin",
                       "password":"password"]
        
        let dict = ["headers": headers,
                    "payload": payload]
        print("parameters",dict)
        return dict
    }
    */
    override func prepareURLRequest(_ request: URLRequest) -> URLRequest{
        var mutableRequest = super.prepareURLRequest(request)
    /*
        let headers = ["version": "1.0.0",
                       "requester": "web",
                       "timestamp": ""]
        
        let payload = ["login":"admin",
                       "password":"password"]
        
        let dict = ["headers": headers,
                    "payload": payload]
        */
        //let text = """{""headers"":{ ""version"": ""1.0.0"",""requester"": ""web"", ""timestamp"":""""},""payload"":{""login"":""admin"",""password"":""password""}}"""
       // let responseString = dict.jsonString
      //  print("responseString",responseString)
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options:JSONSerialization.WritingOptions.prettyPrinted)
        mutableRequest.httpBody = jsonData
        print("mutableRequest.httpBody",mutableRequest.httpBody)
        //mutableRequest.httpBody = responseString.data(using: .utf8)
        mutableRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //mutableRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
       //mutableRequest = SLTApiHelper.urlRequestAddContent(mutableRequest, obj: dict)
        mutableRequest.addValue("com.rnis.auth.action.login", forHTTPHeaderField: "Subject")
        //mutableRequest.addValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
        print("prepareURLRequest",mutableRequest)
        return mutableRequest
    }
    
    override func apiDidReturnReply(_ reply: AnyObject, source: AnyObject){
        print("apiDidReturnReply",reply)
    }
    
    override func apiDidFailWithError(_ error: NSError) {
        print("apiDidFailWithError",error)
    }
}
