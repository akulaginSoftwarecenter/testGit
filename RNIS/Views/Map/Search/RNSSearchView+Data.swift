//
//  RNSSearchView+Data.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSSearchView {
    func prepare(_ text: String?, typeSegment: TypeSearch) {
        guard let text = text  else {
            return
        }
        self.text = text
        self.typeSegment = typeSegment
        
        if typeSegment == .transport {
            return
        }
        request?.cancel()
        if text.count < 3 {
            clearTable()
            clearError()
            removeLoader()
            return
        }
        
        if typeSegment == .stop {
            searchStops()
        } else if typeSegment == .address {
            searchAddress()
        }
        
        //tableView.reloadData()
        //heightTableView.constant = tableView.tableViewContentSize
    }
    
    /// Запрос на поиск остановок
    func searchStops() {
        showLoader()
        request = RNSPostSearch(text, type:typeSegment, complete: { [weak self] items in
            self?.prepareItems(items as? [RNSTextItem])
            }, failure: { [weak self] text in
                self?.prepareClearError(text)
        })
    }
    
    /// Запрос на поиск адресов
    func searchAddress() {
         showLoader()
        request = RNSGetSearchAddress(text, complete: { [weak self] items in
            self?.prepareItems(items)
            }, failure: { [weak self] text in
                self?.prepareClearError(text)
        })
    }
    
    func prepareItems(_ items: [RNSTextItem]?) {
        self.items = items
        tableReload()
        removeLoader()
        clearError()
    }
}
