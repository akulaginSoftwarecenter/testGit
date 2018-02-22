//
//  PostAPI.swift
//  SwiftAPIWrapper
//
//  Created by Alexander Kozin on 26.03.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import Alamofire

/**
 Класс для обработки запротки Post запросов
 */
class PostAPI: AlamofireAPI {
    
    /// переменная метода
    override var method: Alamofire.HTTPMethod {
        return .post
    }

    /// метод подготовки запроса
    override func prepareURLRequest(_ request: URLRequest) -> URLRequest {
        var mutableRequest = super.prepareURLRequest(request)
        mutableRequest.timeoutInterval = 60.0
        return mutableRequest
    }
}
