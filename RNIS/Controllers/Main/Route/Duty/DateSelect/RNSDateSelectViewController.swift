//
//  RNSDateSelectViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер выбора даты
 */
class RNSDateSelectViewController: UIViewController, FadePresent, FadeDismiss {
    
    /// Блок, который вызывается при выборе даты
    var handlerDate: ((Date?) -> ())?
    
    /// Блок, который вызывается при выходе из контроллера
    var handlerDismiss: EmptyBlock?
    
    /// Представление для выбора даты
    @IBOutlet weak var datePicker: UIDatePicker!
    
    /// Кнопка подтверждения
    @IBOutlet weak var oKButton: RNSBlackButton!
    /// Кнопка отмены
    @IBOutlet weak var cancelButton: RNSBlackButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
    }
    
    /// Настройка представлений
    func prepareUI() {
        prepareButton()
        prepareDatePicker()
    }
    
    /// Настройка кнопок
    func prepareButton() {
        oKButton.handlerAction = {[weak self] in
            self?.handlerDate?(self?.datePicker.date)
            self?.dismiss()
        }
        
        cancelButton.handlerAction = {[weak self] in
            self?.dismiss()
        }
    }
    
    /// Функция запускает механизм выхода из контроллера
    func dismiss() {
        handlerDismiss?()
        dismiss(animated: true)
    }
    
    /// Настройка представления для выбора даты
    func prepareDatePicker() {
        datePicker.minimumDate = Date()
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
    }
}
