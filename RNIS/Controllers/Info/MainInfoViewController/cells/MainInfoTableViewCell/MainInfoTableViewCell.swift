//
//  MainInfoTableViewCell.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 29.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

/// Табличная ячейка для отображения информационного раздела
class MainInfoTableViewCell: RNSBaseTableCell {

    /// переменная заголовка
    @IBOutlet weak var title: UILabel!

    /// Метод обновления заголовка
    func updateCell(title: String) {
        self.title.text = title
    }
}

