//
//  RNSAddressViewController+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
//import RealmSwift
/**
 Расширение для работы с таблицей вариантов адресов
 */
extension RNSAddressViewController {
    
    func prepareTableView() {
        tableAddress.isHidden = false
        tableAddress.prepare(text)
        /*
        allTableHidden()
        if textIsClear {
            tableHistory.isHidden = false
            tableHistory.prepare(text)
        } else {
            tableAddress = true
            tableAddress.prepare(text)
        }
         */
    }
    
    func allTableHidden() {
        tableHistory.isHidden = true
        tableAddress.isHidden = true
    }
}

