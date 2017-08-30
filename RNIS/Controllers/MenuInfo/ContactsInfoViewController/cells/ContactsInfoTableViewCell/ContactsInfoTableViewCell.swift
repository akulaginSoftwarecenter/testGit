//
//  ContactsInfoTableViewCell.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 29.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

class ContactsInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descr: UILabel!
    @IBOutlet weak var contactInfoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func updateCell(model: ContactsInfoModel) {
        self.title.text = model.contactTitle
        self.descr.text = model.contactDescr
        if model.contactType == contactType.contactTypePhone.rawValue {
            self.contactInfoImageView.image = UIImage(named: "contactPhoneImage")
        } else {
            self.contactInfoImageView.image = UIImage(named: "contactMailImage")
        }
    }
    
}
