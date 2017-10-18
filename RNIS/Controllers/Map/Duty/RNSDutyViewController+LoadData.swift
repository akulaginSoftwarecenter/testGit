//
//  RNSDutyViewController+LoadData.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 RNSDutyViewController LoadData extention
 */

extension RNSDutyViewController {
    
    func loadData() {
        /*
         prepareError(nil)
         if fromItem?.address?.isEmpty ?? true {
         prepareError("Введите адрес отправления")
         return
         }
         
         if inItem?.address?.isEmpty ?? true {
         prepareError("Введите адрес назначения")
         return
         }
         */
        showLoader()
        RNSPostActionRouting(fromItem, to: inItem, date: currentDate, complete: { [weak self] items in
            RNSPageRouteManager.items = items
            RNSPageRouteController.controller.pushAnimated()
            self?.removeLoader()
            }, failure: { [weak self] text in
                self?.prepareError(text)
                self?.removeLoader()
        })
    }
    
    func loadStartItems(_ fromItem: RNSDutyAddressTemp?, inItem: RNSDutyAddressTemp?) {
        self.fromItem = fromItem
        self.inItem = inItem
        showLoader()
        fromItem?.loadAddress { [weak self] in
            self?.inItem?.loadAddress { [weak self] in
                self?.updateFields()
                self?.removeLoader()
            }
        }
    }
}
