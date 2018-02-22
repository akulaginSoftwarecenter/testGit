//
//  API+ReplyHandling.swift
//
// Created by Alexander Kozin https://github.com/alkozin
// Copyright (c) 2016 http://el-machine.com
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation
import Alamofire

extension API
{
    /**
     Return Reply
     */
    @objc func apiDidReturnReply(_ reply: AnyObject, source: AnyObject)
    {
        lastReply = reply
        lastError = nil

        var shouldUseDefaultErrorHandler = true;

        completion?(reply, nil, &shouldUseDefaultErrorHandler)

        apiDidEnd()
    }
    
    /**
     return error
     */
    @objc func apiDidFailWithError(_ error: NSError)
    {
        lastReply = nil
        lastError = error
        var shouldUseDefaultErrorHandler = true;
        /*
        if error.unauthorized {
              self.reAuthorizeUser()
        } else {
         */
            completion?(nil, error, &shouldUseDefaultErrorHandler)
            if (shouldUseDefaultErrorHandler) {
            //MessageCenter.showError(error)
            }
            apiDidEnd()
        //}
    }
    
    /**
     re AuthorizeUser if need
     */
    @objc func reAuthorizeUser()
    {   /*
        print("reAuthorizeUser")
        SLTAuthManager.reAuthorizeImeI({ (_) in
               self.sendRequest()
            }) { (error) in
                if error?.invalidloginOrPassword ?? false {
                     SLTAuthManager.logout()
                }
            }
        */
    }
    
    /// Метод окончания запроса
    @objc func apiDidEnd() {
       //completion = nil
    }
}
