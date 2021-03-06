//
//  RNSBaseTableCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Класс базовой ячейки таблицы
 */
class RNSBaseTableCell: UITableViewCell {

    /// метод обработки загрузки вью
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = self.contentView.backgroundColor;
    }
    /// метод переопредления setSelected для отключения выделения ячейки
    override func setSelected(_ selected: Bool, animated: Bool) {}
    /// метод переопредления setHighlighted для отключения выделения ячейки
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {}
}
