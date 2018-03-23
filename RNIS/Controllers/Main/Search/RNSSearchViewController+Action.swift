//
//  RNSSearchViewController+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для тапа по кнопкам
 */
extension RNSSearchViewController {
    
    /// Событие переключения вкладки
    @IBAction func actionSegmented(_ sender: UISegmentedControl) {
        clearTable() 
        updateSearch()
    }
    
    /// Событие изменения поискового запроса
    @IBAction func editionChange(_ sender: Any) {
        updateSearch()
    }
    /// Событие нажатия на кнопку конца редактирования
    @IBAction func actionTop(_ sender: Any) {
         hideKeyboard()
    }
    
    /// Спрятать клавиатуру
    func hideKeyboard() {
        view.hideKeyboard()
    }
}
