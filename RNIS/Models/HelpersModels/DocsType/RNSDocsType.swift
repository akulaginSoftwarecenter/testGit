//
//  RNSDocsType.swift
//  RNIS
//
//  Created by Артем Кулагин on 13.12.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

enum RNSDocsType: String {
    case userGuide = "guide",
         termOfUse = "agreement",
         forgotten = "forgotten",
         contacts = "contacts"
    
    var title: String {
        switch self {
        case .userGuide:
            return "Руководство пользователя"
        case .termOfUse:
            return "Пользовательское соглашение"
        case .forgotten:
            return "Забытые вещи"
        case .contacts:
            return "Полезные контакты"
        }
    }
}
