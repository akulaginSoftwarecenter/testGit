//
//  NSError+ErrorItem.swift
//  Solity-iOS
//
//  Created by Vlad on 11.11.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import Foundation

extension NSError
{
    typealias Edges = (left: String.CharacterView.Index, right: String.CharacterView.Index)
    
    var descriptionError: String {
        return getMessage ?? ""
    }
    
    var statusError: Int {
        guard let edges = parse("<title>", "</title>") else {
            return 1000
        }
        
        let rawMessage = response.substring(with: edges.left..<edges.right)

        let code = rawMessage.replacingOccurrences(of: "[^\\d]", with: "", options: .regularExpression, range: nil)
        if let intCode = Int(code) {
            return intCode
        } else {
            return 1000
        }
    }
    
    var unauthorized:Bool {
        return statusError401 && self.descriptionError == "UNAUTHORIZED"
    }
    
    var invalidloginOrPassword:Bool {
        return statusError401 && self.descriptionError == "Invalid login or password"
    }
    
    var statusError401:Bool {
        return self.statusError == 401
    }
    
    fileprivate var response: String {
        return (userInfo["NSLocalizedDescriptionKey"] ?? "") as! String
    }
    
    fileprivate var getMessage:String? {
        guard let edges = parse("<pre>", "</pre>") else {
            return nil
        }
        
        let message = response.substring(with: edges.left..<edges.right)
        return message.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    fileprivate func parse(_ openTag: String, _ closeTag: String) -> Edges?
    {
        let leftEdge = response.range(of: openTag)?.upperBound
        let rightEdge = response.range(of: closeTag)?.lowerBound
        
        guard let left = leftEdge,
            let right = rightEdge else {
                return nil
        }
        return (left, right)
    }
}
