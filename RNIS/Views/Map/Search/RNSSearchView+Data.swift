//
//  RNSSearchView+Data.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с данными
 */
extension RNSSearchView {
    
    func prepare(_ text: String?, typeSegment: TypeSearch = .address) {
        guard let text = text  else {
            return
        }
        self.text = text
        self.typeSegment = typeSegment
        request?.cancel()
        if typeSegment == .transport {
            searchTransport()
            return
        }
        
        if text.count < 3 {
            clearUI()
            return
        }
        
        if typeSegment == .stop {
            searchStops()
        } else if typeSegment == .address {
            searchAddress()
        }
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
    
    func searchTransport() {
        if text?.count == 0 {
            clearUI()
            return
        }
        showLoader()
        request = RNSPostSearch(text, type:typeSegment, complete: { [weak self] items in
            self?.prepareItems(items as? [RNSTextItem])
            }, failure: { [weak self] text in
                self?.prepareClearError(text)
        })
    }
    
    func clearUI() {
        clearTable()
        clearError()
        removeLoader()
    }
    
    /// Метод подготовки массива данных
    func prepareItems(_ items: [RNSTextItem]?) {
        self.items = items
        tableReload()
        removeLoader()
        clearError()
    }
}
