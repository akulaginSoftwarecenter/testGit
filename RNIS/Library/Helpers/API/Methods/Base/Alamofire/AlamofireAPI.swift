//
//  AlamofireAPI.swift
//  SwiftAPIWrapper
//
//  Created by Alexander Kozin on 26.03.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import Alamofire
import Foundation


class AlamofireAPI: API {
    // Change baseURLString to change API target
//     let baseURLString = SLTSettingsManager.serverAddress

    // Override this method to set REST method
    var method: Alamofire.HTTPMethod {
        return .get
    }

    // Override this method to set request relative path
    var path: String {
        preconditionFailure("Request path should be set, override path")
    }

    weak var alamofireRequest: Alamofire.Request?

    override var apiRequestInProgress: Bool {
        return alamofireRequest != nil
    }

    // Creating
    func urlRequest() -> URLRequest {
        let fullPath = serverAddress + path
        let url = URL(string: fullPath)!;
        var urlRequest = URLRequest(url: url)
        
        do {
            urlRequest = try URLEncoding.queryString.encode(urlRequest, with: parameters)
        } catch {
            // Handle error
        }
        
        urlRequest.httpMethod = method.rawValue
        urlRequest = prepareURLRequest(urlRequest)
        if showLogApi {
            print("encodedURLRequest ",urlRequest)
        }
        return urlRequest
    }

    func prepareURLRequest(_ request: URLRequest) -> URLRequest {
        // This is a point to customize URL request
        // E.g. set timeout interval or cache policy
        var mutableRequest = request
        mutableRequest.timeoutInterval = 20.0
        mutableRequest.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
        return mutableRequest
    }

    override func sendRequest()
    {
        let alamofireRequest = Alamofire.request(urlRequest())

        alamofireRequest.response { (response) in
            guard (response.error == nil) else {
                self.apiDidFailWithError(response.error! as NSError)
                self.apiDidEnd()
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments)
                self.requestDidReturnReply(json as AnyObject)
            } catch {
                let string = String(data: response.data!, encoding: String.Encoding.utf8) ?? ""
                self.apiDidFailWithError(NSError(domain: "", code: 1000, userInfo: ["NSLocalizedDescriptionKey": string]))
            }
            self.apiDidEnd()
        }
        self.alamofireRequest = alamofireRequest
    }
}

// RequestProgress
extension AlamofireAPI {

    override func cancel() {
        alamofireRequest?.cancel()
    }

    static let httpManager: SessionManager = {
        let defaultManager = Alamofire.SessionManager.default
        defaultManager.session.configuration.requestCachePolicy = .reloadIgnoringCacheData
        defaultManager.session.configuration.urlCache = nil
        var defaultHeaders = defaultManager.session.configuration.httpAdditionalHeaders!
        defaultHeaders["Accept"] = "application/json"
        return defaultManager
    }()

    @nonobjc static let baseURL: URL = {
        // This is a place to configure API base URL if depends on something
        // E.g. builds for different servers
        let baseURL = URL(string: serverAddress)!

        return baseURL
    }()

    override func apiDidEnd() {
        super.apiDidEnd()
        alamofireRequest = nil
    }

    override var debugDescription: String {
        return String(format: "%@, path:%@", super.description, path)
    }
    
    func superError() {
        super.apiDidFailWithError(NSError(domain: "error parse", code: 0, userInfo: [:]))
    }
}
