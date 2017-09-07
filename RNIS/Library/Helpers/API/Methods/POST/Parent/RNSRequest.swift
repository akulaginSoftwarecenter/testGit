//
//  PostRequest.swift
//  RNIS
//
//  Created by Артем Кулагин on 20.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

class RNSRequest: AlamofireAPI {
    
    override var path: String {
        return serverRnisapi
    }
    
    var subject: String {
        return ""
    }
    
    override var parameters: AliasDictionary {
        return ["headers": headers,
                "payload": payload]
    }
    
    var headers: AliasDictionary {
        return ["version": "1.0",
                "requester": "web"]
    }
    
    var payload: AliasDictionary {
        return AliasDictionary()
    }
    
    override func prepareURLRequest(_ request: URLRequest) -> URLRequest{
        var mutableRequest = super.prepareURLRequest(request)
        mutableRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options:[])
        mutableRequest.addValue(subject, forHTTPHeaderField: "Subject")
        return mutableRequest
    }
   
    override func apiDidFailWithError(_ error: NSError) {
        if showLogApi {
            print("apiDidFailWithError",error)
        }
        super.apiDidFailWithError(error)
        removeLoader()
    }
    
    func removeLoader() {
        STRouter.removeLoader()
    }
    
    func showLoader() {
        STRouter.showLoader()
    }
}
