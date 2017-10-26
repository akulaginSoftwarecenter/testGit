//
//  RNSForecastCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Ячейки для таблицы уведомлений о приходе последнего ТС
 */

class RNSForecastCell: RNSBaseTableCell {
    
    /// Поле для номера маршрута
    @IBOutlet weak var numberLabel: UILabel!
    /// Поле для периода уседомления
    @IBOutlet weak var periodLabel: UILabel!
    /// Поле для отображения времени
    @IBOutlet weak var timeLabel: UILabel!
    /// Экземпляр модели для отображения времени
    @IBOutlet weak var timeView: UIView!
    
    var item: RNSForecastBus? {
        didSet {
            updateUI()
        }
    }
    
    /// Функция обновления вида
    func updateUI() {
        numberLabel.text = item?.route_number
        
        hiddenAll()
        if let time = item?.time {
            timeView.isHidden = false
            timeLabel.text = "\(time) мин."
        } else {
           // periodLabel.isHidden = false
           // periodLabel.text = "Каждые \(item?.timePerod ?? 0) мин."
        }
    }
    
    /// Функция скрывания всех элементов вида
    func hiddenAll() {
        periodLabel.isHidden = true
        timeView.isHidden = true
    }
}
