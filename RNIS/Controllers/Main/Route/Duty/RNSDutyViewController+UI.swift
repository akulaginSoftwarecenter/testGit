//
//  RNSDutyViewController+UI.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с представлениями
 */
extension RNSDutyViewController {
    
    /// Переменная показывает установлена ли дата в данный момент
    var isHaveDate: Bool {
        return currentDate != nil
    }
    
    /// Обновление текстовых полей "куда" и "откуда"
    func updateFields() {
        fromLabel.text = fromItem?.address
        toLabel.text = inItem?.address
        updatePlaceHolders()
    }
    
    func updatePlaceHolders() {
        fromPlaceholderLabel.isHidden = !(fromLabel.text?.isEmpty ?? true)
        toPlaceholderLabel.isHidden = !(toLabel.text?.isEmpty ?? true)
    }
    
    /// Настройка кнопки поиска
    func prepareSearchButton() {
        searchButton.handlerAction = { [weak self] in
            self?.loadData()
        }
    }
    
    /// Настройка надписи для отображения ошибок
    ///
    /// - Parameter error: текст ошибки
    func prepareError(_ error: String?) {
        errorLabel.text = error
    }
    
    /// Настройка текущей даты
    ///
    /// - Parameter date: дата
    func prepareDate(_ date: Date?) {
        currentDate = date
        updateDate()
    }
    
    /// Обновление надписи даты
    func updateDate() {
        dateLabel.text = isHaveDate ? currentDate?.stringE_d_MMMM : "Выберите дату и время"
        rightDateConstraint.constant = isHaveDate ? 44 : 15
        crossButton.isHidden = !isHaveDate
    }
    
    /// Показать индикатор загрузки
    func showLoader() {
        loaderView.showInView(view, belowSubview: backButton)
    }
    
    /// Убрать индикатор загрузки
    func removeLoader() {
        loaderView.remove()
    }
}
