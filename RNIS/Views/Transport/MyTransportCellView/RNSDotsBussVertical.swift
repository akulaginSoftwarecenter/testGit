//
//  RNSMyTransportCellView.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Класс создание ячейки таблицы отображения ТС
 */
class RNSDotsBussVertical: BaseViewWithXIBInit {

    /// Создание "слабого" экземпляра таблицы
    @IBOutlet weak var tableView: RNSRegisterTableView!
    /// Создание поля длительности движения
    @IBOutlet weak var durationLabel: UILabel!
    /// Создание поля названия
    @IBOutlet weak var titleLabel: UILabel!
    
    /// Массив элементов точек движения
    var items: [RNSVerticalTableItem] {
        return dotsVerticalModel?.items ?? []
    }
    
    /// Массив вариантов движения
    var item: RNSRouteVariant? {
        didSet {
           dotsVerticalModel = item?.dotsVerticalModel
           updateUI()
        }
    }
    
    /// Переменная элемента точек движения
    var dotsVerticalModel: RNSDotsVerticalModel?
    
    /// Функция обновления элементов ячейки
    func updateUI() {
        tableView.reloadData()
        durationLabel.text = dotsVerticalModel?.duration
        titleLabel.text = item?.name
    }
}
