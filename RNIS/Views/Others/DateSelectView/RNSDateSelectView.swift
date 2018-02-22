//
//  RNSDateSelectView.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Представление для выбора даты
 */
class RNSDateSelectView: BaseViewWithXIBInit {
    
    /// Обработчик изменения даты
    var handlerDate: ((Date?) -> ())?
    
    /// Пикер
    @IBOutlet weak var datePicker: UIDatePicker!
    
    /// Кнопка согласия
    @IBOutlet weak var oKButton: RNSBlackButton!
    /// Кнопка отмены
    @IBOutlet weak var cancelButton: RNSBlackButton!
    
    /// метод обработки загрузки вью
    override func awakeFromNib() {
        super.awakeFromNib()
     
        prepareUI()
    }
}
