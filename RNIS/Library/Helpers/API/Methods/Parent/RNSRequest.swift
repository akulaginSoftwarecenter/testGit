//
//  PostRequest.swift
//  RNIS
//
//  Created by Артем Кулагин on 20.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

/**
 Запрос родительский
 */
class RNSRequest: AlamofireAPI {
    
    override var path: String {
        return UserDefaults.serverApi ?? ""
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
        let headers = [
            "x-requested-with": "XMLHttpRequest",
            "subject": "\(subject)",
            "cache-control": "no-cache"
        ]
        mutableRequest.allHTTPHeaderFields = headers
        mutableRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        if showLogApi,isShowLogRequest {
            print("subject",subject)
        }
        return mutableRequest
    }
    
    /// Убрать индикацию загрузки
    func removeLoader() {
        STRouter.removeLoader()
    }
    /// Функция появления лоадера
    func showLoader() {
        STRouter.showLoader()
    }
    
    var cashed: Bool {
        return false
    }
    
    var cacheKey: String {
        return subject + parameters.description
    }
    
    var cacheData: AnyObject? {
        return RNSCasheManager.object(cacheKey)
    }
    
    override func sendRequestWithCompletion(completion: @escaping APICompletion) {
        super.sendRequestWithCompletion { (object, error, inot) in
            if self.cashed {
                RNSCasheManager.setObject(object, key: self.cacheKey)
            }
            completion(object, error, &inot)
        }
    }
}
