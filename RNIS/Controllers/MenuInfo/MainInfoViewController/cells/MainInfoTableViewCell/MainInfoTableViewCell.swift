//
//  MainInfoTableViewCell.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 29.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

class MainInfoTableViewCell: RNSBaseTableCell {

    @IBOutlet weak var title: UILabel!

    func updateCell(title: String) {
        self.title.text = title
    }
}

