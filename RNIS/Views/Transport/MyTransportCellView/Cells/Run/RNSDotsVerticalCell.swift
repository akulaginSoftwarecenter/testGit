//
//  RNSDotsVerticalRun.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Класс создание точек движения по маршруту
 */
class RNSDotsVerticalCell: RNSBaseTableCell {
    
    /// Создание "слабого" экземпляря вида
    @IBOutlet weak var cirlce: UIView!

    /// Создание "слабого" экземпляря линии движения по маршруту
    @IBOutlet weak var runLine: RNSDotsWhiteVertical!
    /// Создание "слабого" экземпляря линии движения ТС
    @IBOutlet weak var busLine: UIView!
    /// Создание "слабого" экземпляря заголовка названия
    @IBOutlet weak var labelTitle: UILabel!
    /// Создание "слабого" экземпляря поля названия ТС
    @IBOutlet weak var labelBus: UILabel!
    /// Создание "слабого" экземпляря вида названия ТС
    @IBOutlet weak var viewBus: UIView!
    
    /// Функция требования обновления вида ячейки
    var item: RNSVerticalTableItem? {
        didSet {
            updateUI()
        }
    }
    
    /// Фнукция обновления вида ячейки таблицы
    func updateUI() {
        hiddenAll()
        guard let item = item else {
            return
        }
        if item.isEnd {
            cirlce.isHidden = false
            return
        }
        
        cirlce.isHidden = item.isBus
        runLine.isHidden = !item.isRun
        labelTitle.text = item.title
        labelBus.text = item.titleBus
        
        if item.isBus {
            labelBus.isHidden = false
            viewBus.isHidden = false
            busLine.isHidden = false
        }
    }
    
    /// Фнукция скрытия вида ячейки таблицы
    func hiddenAll() {
        cirlce.isHidden = true
        runLine.isHidden = true
        busLine.isHidden = true
        labelBus.isHidden = true
        viewBus.isHidden = true
    }
}
