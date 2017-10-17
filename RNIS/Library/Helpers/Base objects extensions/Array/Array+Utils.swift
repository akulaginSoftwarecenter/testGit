//
//  Array+Utils.swift
//  Spytricks
//
//  Created by Артем Кулагин on 15.06.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import Foundation

extension Array where Element: Any {
    
    func valueAt(_ index: Int?) -> Element? {
        guard let index = index,
            index < count,
            index >= 0  else {
            return nil
        }
        return self[index]
    }
    typealias AliasHandler = (Element?) -> ()
    func enumerateRange(_ range: CountableRange<Int>, handler: AliasHandler?) {
        guard range.lowerBound <= range.upperBound  else {
            return
        }
        range.forEach{
            handler?(valueAt($0))
        }
    }
    
    func enumerateNonFirst(handler: AliasHandler?) {
        enumerateRange(1..<count, handler: handler)
    }
}

