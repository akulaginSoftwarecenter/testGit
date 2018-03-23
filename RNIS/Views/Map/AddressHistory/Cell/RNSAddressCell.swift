//
//  RNSAddressCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Табличная ячейка для отображения текста адреса в списке
 */
class RNSAddressCell: RNSBaseTableCell {
    
    /// Текст адреса
    var item: RNSSearchHistory? {
        didSet{
            titleLabel?.text = item?.title
        }
    }
    /// UILabel для отображения заголовка
    @IBOutlet weak var titleLabel: UILabel!
}
