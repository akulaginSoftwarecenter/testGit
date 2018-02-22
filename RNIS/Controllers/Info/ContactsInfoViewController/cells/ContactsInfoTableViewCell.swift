//
//  ContactsInfoTableViewCell.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 29.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

/// Табличная ячейка для отображения информации о контактах
class ContactsInfoTableViewCell: RNSBaseTableCell {

    /// Переменная отображения заголовка
    @IBOutlet weak var title: UILabel!
    
    /// Переменная отображения
    @IBOutlet weak var descr: UILabel!
    
    /// Переменная отображения изображения контакта
    @IBOutlet weak var contactInfoImageView: UIImageView!
    
    /// Метод обновления ячейки
    func updateCell(_ model: RNSContactItem?) {
        guard let model = model else {
            return
        }
        title.text = model.name
        descr.text = model.value
        contactInfoImageView.image = model.isPhone ? #imageLiteral(resourceName: "contactPhoneImage") : #imageLiteral(resourceName: "contactMailImage")
    }
}
