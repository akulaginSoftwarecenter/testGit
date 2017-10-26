//
//  RNSConductorView.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Представление для отображения информации о кондукторе
 */
class RNSConductorView: BaseViewWithXIBInit {
    
    /// модель автобуса
    var item: RNSBusTemp? {
        didSet {
            updateUI()
        }
    }
    
    /// Надпись с информацией о водителе
    @IBOutlet weak var driverLabel: UILabel!
    /// Надпись с информацией о кондукторе
    @IBOutlet weak var сonductorLabel: UILabel!
    
    /// Обновление представлений
    func updateUI() {
        driverLabel.text = "Водитель: " + (item?.driver ?? "")
        сonductorLabel.text = "Кондуктор: " + (item?.check_taker ?? "")
    }
    
    /// Событие нажатия
    @IBAction func actionButton(_ sender: Any) {
        RNSBusInfoViewController.initController(item)?.pushAnimatedRedScroll()
    }
}
