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

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descr: UILabel!
    @IBOutlet weak var contactInfoImageView: UIImageView!
    
    func updateCell(_ model: RNSContactItem?) {
        guard let model = model else {
            return
        }
        title.text = model.name
        descr.text = model.value
        contactInfoImageView.image = model.isPhone ? #imageLiteral(resourceName: "contactPhoneImage") : #imageLiteral(resourceName: "contactMailImage")
    }
}
