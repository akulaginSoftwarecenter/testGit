//
//  RNSNewsCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 30.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Класс ячейки новостей
 */
class RNSNewsCell: RNSBaseTableCell {

    /// UILabel для отображения заголовка
    @IBOutlet weak var label: UILabel!
    
    /// главная переменная инициализации
    var item: RNSNewsTemp? {
        didSet{
            updateItem()
        }
    }
    
    func updateItem() {
        label?.text = item?.titleDate
    }
}

