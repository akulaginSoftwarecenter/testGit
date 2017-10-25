//
//  RNSAddressViewController+TextField.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с текстовыми полями
 */
extension RNSAddressViewController: UITextFieldDelegate {
    
    /// Заполнение текстового поля сохраненным адресом
    func prepareTextField() {
        textField.text = item?.address
    }
    
    /// Настройка текста поля
    ///
    /// - Parameter text: текст адреса
    func prepareAddress(_ text: String?) {
        textField.text = text
    }
    
    /// Получение текущего текста из текстового поля
    var text: String? {
       return textField.text
    }
    
    /// Событие начала редактирования поля адреса
    func startEdit() {
        tableView.isHidden = false
        prepareTableView()
        buttonMyLocation.isHidden = true
    }
    
    /// Событие завершения редактирования поля адреса
    func endEdit() {
        tableView.isHidden = true
        textField.endEditing(true)
        buttonMyLocation.isHidden = false
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        startEdit()
    }
   
    public func textFieldDidEndEditing(_ textField: UITextField) {
        prepareTableView()
        endEdit()
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        prepareTableView()
        return true
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEdit()
        return true
    }
    
    @IBAction func textFieldEditingChanged(_ sender: Any) {
        prepareTableView()
    }
}
