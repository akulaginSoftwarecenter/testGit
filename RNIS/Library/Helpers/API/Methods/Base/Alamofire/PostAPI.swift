//
//  PostAPI.swift
//  SwiftAPIWrapper
//
//  Created by Alexander Kozin on 26.03.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import Alamofire

class PostAPI: AlamofireAPI {
    override var method: Alamofire.HTTPMethod {
        return .post
    }

    override func prepareURLRequest(_ request: URLRequest) -> URLRequest {
        var mutableRequest = super.prepareURLRequest(request)
        mutableRequest.timeoutInterval = 60.0
        return mutableRequest
    }
}
