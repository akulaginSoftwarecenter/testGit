//
//  RNSSearchViewController+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/// Расширение для работы с таблицей
extension RNSSearchViewController {
    
    func prepareSearchView() {
        searchView.widthCell = UIScreen.width - 30
    }

    func clearTable() {
        searchView.clearTable()
    }
    
    /// Подписка на клоужеры
    func prepareHandlers() {
        searchView.handlerLoader = {[weak self] value in
            if value {
                self?.showLoader()
            } else {
                self?.removeLoader()
            }
        }
        
        searchView.handlerError = {[weak self] value in
            self?.errorLabel.text = value
        }
        
        searchView.handlerShowItem = {[weak self] value in
            self?.showItem(value)
        }
    }
    
    /// Убрать индикатор загрузки
    
    func showLoader() {
        loaderView.showInView(self.view)
    }
    
    /// Убрать индикацию загрузки
    func removeLoader() {
        loaderView.remove()
    }
     
    /// Обновление представлений используя последний поисковый запрос если он имеется
    func checkSaved() {
        prepareSegment(RNSSearchManager.type ?? .transport)
        guard let text = RNSSearchManager.text, !text.isEmpty else {
            return
        }
        textField.text = text
        updateSearch()
    }
}

