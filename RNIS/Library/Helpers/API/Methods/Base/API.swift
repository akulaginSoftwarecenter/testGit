//
//  API.swift
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

import Alamofire

public typealias APICompletion = (_ reply: AnyObject?, _ error: NSError?, _ handleError: inout Bool) -> ()
public typealias APIProgress = (_ progress: Double) -> ()


public class API: NSObject {
    
    var object: AnyObject?
    
   
    var parameters: AliasDictionary {
        let parameters = AliasDictionary()
        
        //parameters["sid"] = SLTAuthManager.token as AnyObject?
 
        return parameters
    }

    
    var lastReply: AnyObject?

    
    var lastError: NSError?;

    
    var completion: APICompletion?

    
    var progressBlock: APIProgress?

    
    var apiRequestInProgress: Bool {
        preconditionFailure("Concrete API object should override progress indicator like 'return alamofireRequest != nil'")
    }

    var shouldLogRequest = false
    var shouldAddAccessToken = true

    override init() {
        super.init()
        prepare()
    }

    
    private func prepare() {
        // E.g. add access token to request or log level
        //        [self setShouldAddAccessToken:YES];
        //        [self setShouldLogRequest:NO];
    }

    
    func sendRequestWithCompletion(completion: @escaping APICompletion) {
        self.completion = completion
        
        sendRequest()
    }
    
    func sendRequest()
    {}
}
