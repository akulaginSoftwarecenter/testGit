//
//  RNSTransportTableViewCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
/**
Ячейка таблицы для отображения ТС
 */
class RNSTransportTableViewCell: RNSBaseTableCell {
    @IBOutlet weak var dotsView: RNSDotsBussVertical!
    
    /// Элемент выбора варианта маршрута
    var item: RNSRouteVariant? {
        didSet {
            dotsView.item = item
        }
    }
}
