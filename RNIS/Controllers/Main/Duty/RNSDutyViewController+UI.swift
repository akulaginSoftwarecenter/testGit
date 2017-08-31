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
        currentDate = date
        updateDate()
    }
    
    func updateDate() {
        dateLabel.text = isHaveDate ? currentDate?.stringDDMMyyyy_HHmm : "Выберите дату и время"
        rightDateConstraint.constant = isHaveDate ? 44 : 15
        crossButton.isHidden = !isHaveDate
    }
    
    var isHaveDate: Bool {
        return currentDate != nil
    }
    
    

}
