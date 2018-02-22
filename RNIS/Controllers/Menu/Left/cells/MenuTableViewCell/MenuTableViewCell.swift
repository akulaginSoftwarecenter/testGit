//
//  MenuTableViewCell.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

/// Табличная ячейка для меню
class MenuTableViewCell: RNSBaseTableCell {
    
    /// переменная заголовка
    @IBOutlet weak var cellTitle: UILabel!
    
    /// переменная изображения
    @IBOutlet weak var cellImageView: UIImageView!

    /// Обновление ячейки
    ///
    /// - Parameters:
    ///   - title: Надпись
    ///   - image: Иконка
    func updateCell(title: String!, image: UIImage!) {
        self.cellTitle.text = title
        self.cellImageView.image = image
    }
}
