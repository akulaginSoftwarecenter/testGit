//
//  AlamofireAPI.swift
//  SwiftAPIWrapper
//
//  Created by Alexander Kozin on 26.03.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import Alamofire
import Foundation

/**
 Класс для обработки запротки Get запросов
 */
class AlamofireAPI: API {

    /// Override this method to set REST method
    var method: Alamofire.HTTPMethod {
        return .get
    }

    /// Override this method to set request relative path
    var path: String {
        preconditionFailure("Request path should be set, override path")
    }
    /// Параметр хранилище запроса
    weak var alamofireRequest: Alamofire.Request?

    /// Параметр определяющий что запрос выполняется
    override var apiRequestInProgress: Bool {
        return alamofireRequest != nil
    }

    /// Creating
    func urlRequest() -> URLRequest {
        let fullPath = serverAddress + path
        let url = URL(string: fullPath)!;
        var urlRequest = URLRequest(url: url)
        /*
        do {
            urlRequest = try URLEncoding.queryString.encode(urlRequest, with: parameters)
        } catch {
            // Handle error
        }
        */
        urlRequest.httpMethod = method.rawValue
        urlRequest = prepareURLRequest(urlRequest)
        
        if showLogApi,isShowLogRequest {
            print("parameters",parameters)
            print("encodedURLRequest ",urlRequest)
        }
        return urlRequest
    }
    
    /// Подготовка запроса
    @objc func prepareURLRequest(_ request: URLRequest) -> URLRequest {
        // This is a point to customize URL request
        // E.g. set timeout interval or cache policy
        var mutableRequest = request
        mutableRequest.timeoutInterval = 60.0
        mutableRequest.cachePolicy = NSURLRequest.CachePolicy.useProtocolCachePolicy
        return mutableRequest
    }

    /// Метод отправка запроса
    override func sendRequest()
    {
        let alamofireRequest = Alamofire.request(urlRequest())
        let request = alamofireRequest.request
        
        if let request = request, showLogApi, showLogApiDetail {
            print("==> \(request.httpMethod ?? "...") \(request.url?.absoluteString ?? "n/a")")
            print("Headers: \(request.allHTTPHeaderFields ?? [:])")
            print("Parameters: \(parameters)")
        }
        alamofireRequest.response { (response) in
            guard (response.error == nil) else {
                self.apiDidFailWithError(response.error! as NSError)
                self.apiDidEnd()
                return
            }
            if let httpResponse = response.response, let bodyData = response.data, let body = String(data: bodyData, encoding: .utf8), showLogApi, showLogApiDetail {
                print("<== \(httpResponse.statusCode) \(request?.url?.absoluteString ?? "n/a")")
                print("Headers: \(httpResponse.allHeaderFields)")
                print("Body: \(body)")
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments)
                self.parseResponseJson(json as AnyObject)
            } catch {
                let string = String(data: response.data!, encoding: String.Encoding.utf8) ?? ""
                print("alamofireRequest.response",string)
                self.apiDidFailWithError(NSError(domain: "", code: 1000, userInfo: ["NSLocalizedDescriptionKey": string]))
            }
            self.apiDidEnd()
        }
        self.alamofireRequest = alamofireRequest
    }
    
    /// Метод парсинга Json
    func parseResponseJson(_ json: AnyObject) {
        requestDidReturnReply(json)
    }
    
    /// Метод для обработки ошибок
    override func apiDidFailWithError(_ error: NSError) {
        if showLogApi {
            print("apiDidFailWithError",error)
        }
        super.apiDidFailWithError(error)
        if error.isLostInet {
            showErrorNetwork()
        }
        STRouter.removeLoader()
    }
    
    /// Метод отображения универсальной ошибки сети
    func showErrorNetwork() {
        STAlertRouter.showErrorNetwork()
    }
}

// RequestProgress
extension AlamofireAPI {
    
    /// Метод отмена запроса
    override func cancel() {
        alamofireRequest?.cancel()
    }

    /// Синглетон httpManager
    static let httpManager: SessionManager = {
        let defaultManager = Alamofire.SessionManager.default
        defaultManager.session.configuration.requestCachePolicy = .reloadIgnoringCacheData
        defaultManager.session.configuration.urlCache = nil
        var defaultHeaders = defaultManager.session.configuration.httpAdditionalHeaders!
        defaultHeaders["Accept"] = "application/json"
        return defaultManager
    }()

    /// Переменная для установления базового адреса
    @nonobjc static let baseURL: URL = {
        // This is a place to configure API base URL if depends on something
        // E.g. builds for different servers
        let baseURL = URL(string: serverAddress)!

        return baseURL
    }()

    /// Метод окончания запроса
    override func apiDidEnd() {
        super.apiDidEnd()
        alamofireRequest = nil
    }

    /// Переменная для описания отладки
    override var debugDescription: String {
        return String(format: "%@, path:%@", super.description, path)
    }
    
    /// Метод возврата ошибки по умолчанию
    @objc func superError() {
        super.apiDidFailWithError(NSError(domain: "error", code: 0, userInfo: [:]))
    }
}
