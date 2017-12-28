//
//  RNSAddressViewController+Containers.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.12.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

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
        tableAddressHidden()
    }
    
    func tableAddressHidden() {
        tableAddress.hidden()
    }
    
    func tableAddressHiddenIfNeed(_ item: RNSAddressTemp?) {
        if item?.isHouse ?? false {
            tableAddressHidden()
        }
    }
}
