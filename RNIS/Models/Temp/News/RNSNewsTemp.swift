//
//  RNSNewsTemp.swift
//  RNIS
//
//  Created by Артем Кулагин on 30.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

import ObjectMapper

class RNSNewsTemp: RNISMappableBase {
    
    var uuid: String?
    var title: String?
    var image: String?
    var text: String?
    var timestamp: String?
    var is_active: Bool?
    var is_pinned: Bool?
    var anounce: String?
    
    var dateString: String?
    var titleDate: String?
    
    override func mapping(map: Map) {
        uuid <- map["uuid"]
        title <- map["title"]
        image <- map["image"]
        text <- map["text"]
       is_active <- map["is_active"]
        is_pinned <- map["is_pinned"]
        anounce <- map["anounce"]
        timestamp <- map["timestamp"]
        prepareDate()
        prepareTitleDate()
    }
    
    func prepareDate() {
        let countIndex = 10
        guard let str = timestamp, str.count >= countIndex else {
            return
        }
        let startIndex = str.index(str.startIndex, offsetBy:countIndex)
        let sub = String(str[..<startIndex])
        if let text =  DateFormatter.timestamp.date(from: sub)?.stringdMMMMyyyy {
            dateString = "Опубликовано: \(text)"
        }
    }
    
    func prepareTitleDate() {
        guard var title = title else {
            return
        }
        if let dateString = dateString {
            title.append("\n\(dateString)")
        }
        titleDate = title
        
    }
}
