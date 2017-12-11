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
        endEdit()
    }
    
    /// Настройка текста поля
    ///
    /// - Parameter text: текст адреса
    func prepareAddress(_ text: String?) {
        textField.text = text
    }
     
    func prepareAddressContainers(_ text: String?) {
        prepareAddress(text)
        prepareTableView()
    }
    
    /// Получение текущего текста из текстового поля
    var text: String? {
       return textField.text
    }
    
    var textIsClear: Bool {
        return text?.count == 0
    }
    
    /// Событие начала редактирования поля адреса
    func startEdit() {
        containerTables.isHidden = false
        prepareTableView()
        rightTextFildConstraint.constant = 0
        buttonMyLocation.isHidden = true
    }
    
    /// Событие завершения редактирования поля адреса
    func endEdit() {
        containerTables.isHidden = true
        textField.endEditing(true)
        rightTextFildConstraint.constant = 40
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
        removePin()
        prepareTableView()
    }
}
