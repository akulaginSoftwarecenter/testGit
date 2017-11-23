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
        allTableHidden()
        if textIsClear {
            tableHistory.show()
            tableHistory.prepare(text)
        } else {
            tableAddress.show()
            tableAddress.prepare(text)
        }
    }
    
    func allTableHidden() {
        tableHistory.hidden()
        tableAddress.hidden()
    }
}

