//
//  RNSDutyViewController+UI.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSDutyViewController {
    
    func prepareSearchButton() {
        searchButton.handlerAction = {
            RNSPageRouteManager.generateItems()
            RNSPageRouteController.controller.pushAnimated()
        }
    }
    
    func prepareDate(_ date: Date?) {
        print("prepareDate", date)
    }
}
