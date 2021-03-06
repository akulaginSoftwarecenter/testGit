//
//  API+Creating.swift
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

/**
 Расширение для работы с созданием запроса
 */
extension API {
    /**
     Creates api instance

     - parameter object:     Object for generating request

     - returns: API object
     */
    convenience init(object: AnyObject?) {
        self.init()

        self.object = object
    }

    /**
     Creates api instance and send request

     - parameter completion: A block that invokes after request is finished

     - returns: API object
     */
    @discardableResult
    convenience init(completion: @escaping APICompletion) {
        self.init(object: nil, completion: completion)
    }

    /**
     Creates api instance and send request

     - parameter object:     Object for generating a request
     - parameter completion: A block that invokes after request is finished

     - returns: API object
     */
    @discardableResult
    convenience init(object: AnyObject?, completion: @escaping APICompletion) {
        self.init(object: object)

        sendRequestWithCompletion(completion: completion)
    }
}
