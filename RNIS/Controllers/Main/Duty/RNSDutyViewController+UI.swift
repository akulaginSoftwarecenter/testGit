//
//  RNSDutyViewController+UI.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 RNSDutyViewController UI extention
 */

extension RNSDutyViewController {
    
    var isHaveDate: Bool {
        return currentDate != nil
    }
    
    func updateFields() {
        fromField.text = fromItem?.address
        inField.text = inItem?.address
    }
    
    func prepareSearchButton() {
        searchButton.handlerAction = { [weak self] in
            self?.loadData()
        }
    }
    
    func  prepareError(_ error: String?) {
        errorLabel.text = error
    }
    
    func prepareDate(_ date: Date?) {
        currentDate = date
        updateDate()
    }
    
    func updateDate() {
        dateLabel.text = isHaveDate ? currentDate?.stringE_d_MMMM : "Выберите дату и время"
        rightDateConstraint.constant = isHaveDate ? 44 : 15
        crossButton.isHidden = !isHaveDate
    }
    
    func showLoader() {
        loaderView.showInView(self.view)
    }
    
    func removeLoader() {
        loaderView.remove()
    }
}
