//
//  Dictionary+Utils.swift
//  Spytricks
//
//  Created by Артем Кулагин on 14.02.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import Foundation

/**
 Расширение для Dictionary
 */
extension Dictionary {
    
    mutating func merge(with dictionary: Dictionary?) {
        guard let dictionary = dictionary else {
            return
        }
        dictionary.forEach { updateValue($1, forKey: $0) }
    }
    
    mutating func merge<S>(_ other: S)  where S: Sequence, S.Iterator.Element == (key: Key, value: Value) {
        for (k, v) in other {
            self[k] = v
        }
    }
    func merged(with dictionary: Dictionary) -> Dictionary {
        var dict = self
        dict.merge(with: dictionary)
        return dict
    }
    
    var jsonString:String {
        let jsonData = try? JSONSerialization.data(withJSONObject: self, options:JSONSerialization.WritingOptions.prettyPrinted)
        return NSString(data: jsonData!, encoding: String.Encoding.utf8.rawValue)! as String
    }
}
