//
//  SLTApiHelper.swift
//  Solity-iOS
//
//  Created by Artem Kulagin on 14.09.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import UIKit

/**
 Класс помощьник для API
 */
class SLTApiHelper {

    static func urlRequestAddContent(_ request: URLRequest, obj: [String : Any]) -> URLRequest
    {
        var mutableRequest = request
        let jsonData = try? JSONSerialization.data(withJSONObject: obj, options:JSONSerialization.WritingOptions.prettyPrinted)
        mutableRequest.httpBody = jsonData
        mutableRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return mutableRequest
    }
    
    static func urlRequestForImageAddContent(_ request: URLRequest, obj: AnyObject) -> URLRequest
    {
        var mutableRequest = request
        guard let data = obj as? Data else {
            return mutableRequest
        }
        mutableRequest.httpBody = data
        mutableRequest.addValue("image/jpeg", forHTTPHeaderField: "Content-Type")
        return mutableRequest
    }
}
