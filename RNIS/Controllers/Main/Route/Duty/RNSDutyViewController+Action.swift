//
//  RNSDutyViewController+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для обработки некоторых событий
 */
extension RNSDutyViewController {
    
    /// Событие нажатия на кнопку "поменять адреса местами"
    @IBAction func actionExchange(_ sender: Any) {
        let item = fromItem
        fromItem = inItem
        inItem = item
        updateFields()
    }
    
    /// Событие нажатия на кнопку ввода адреса "откуда"
    @IBAction func actionFrom(_ sender: Any) {
        showAddress(.fromAddress) {[weak self] (item) in
            self?.fromItem = item
            self?.updateFields()
        }
    }
    
    /// Событие нажатия на кнопку ввода адреса "куда"
    @IBAction func actionIn(_ sender: Any) {
        showAddress(.inAddress) {[weak self] (item) in
            self?.inItem = item
            self?.updateFields()
        }
    }
    
    /// Событие нажатия на кнопку установки даты и времени
    @IBAction func dateAction(_ sender: Any) {
        let vc = RNSDateSelectViewController.initialController as? RNSDateSelectViewController
        vc?.transitioningDelegate = CustomTransitionDelegate.shared
        vc?.handlerDate = { [weak self] date in
            self?.prepareDate(date)
        }
        STRouter.present(vc)
    }
    
    /// Событие нажатия на кнопку сброса даты
    @IBAction func crossAction(_ sender: Any) {
        prepareDate(nil)
    }
    
    /// Функция открывает контроллер демонстрации адреса на карте с возможностью редактирования
    ///
    /// - Parameters:
    ///   - type: тип адреса
    ///   - complete: блок, который будет выполнен после завершения работы вызванного контроллера
    func showAddress(_ type: TypeAddress, complete: AliasAddressComplete?) {
        let item = type == .fromAddress ? fromItem : inItem
        RNSAddressViewController.initController(item, type: type, complete: complete)?.pushAnimated()
    }
}
