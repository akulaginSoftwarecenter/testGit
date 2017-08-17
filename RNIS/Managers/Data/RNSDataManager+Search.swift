//
//  RNSDataManager+Search.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
import RealmSwift

extension RNSDataManager {
    
    static func searchItems(_ text: String?) -> [RNSSearchHistory]? {
        guard let text = text, !text.isEmpty else {
            return searchItems
        }
        return searchItems?.filter{
            let title = $0.title
            return title.contains(text) && (title != text)
        }
    }
    
    static var searchItems: [RNSSearchHistory]? {
        guard let result =  realm?.objects(RNSSearchHistory.self) else {
            return nil
        }
        return Array(result)
    }
    
    static func createSearchItem(_ text: String) {
        guard !text.isEmpty else {
            return
        }
        
        if searchItems?.contains(where: {$0.title == text}) ?? false {
            return
        }
        write({
            let item = RNSSearchHistory()
            item.title = text
            realm?.add(item)
        })
    }
}