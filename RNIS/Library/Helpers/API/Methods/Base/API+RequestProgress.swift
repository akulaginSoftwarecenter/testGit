//
//  API+RequestProgress.swift
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
     Cancels request
     */
    @objc func cancel() {
        preconditionFailure("Concrete API object should override cancel method like 'alamofireRequest?.cancel()'")
    }
    
    /// Флаг отображения лога ответа по запросу
    @objc var isShowLogReply: Bool {
        return showLogApi
    }
    
    /// Флаг отображения тела запроса
    @objc var isShowLogRequest: Bool {
        return showLogApi
    }

    /**
     Return Reply
     */
    func requestDidReturnReply(_ reply: AnyObject) {
        let parsedReply = reply

        //        let classForParsingReply = self.classForParsingReply()
        //        if (classForParsingReply != nil) {
        //            classForParsingReply!()
        //        }
        if isShowLogReply {
            print("apiDidReturnReply",reply)
        }
        apiDidReturnReply(parsedReply, source: reply)
    }
    
    /// Метод возврата класса для парсинга
    func classForParsingReply() -> AnyClass? {
        return nil
    }
}
