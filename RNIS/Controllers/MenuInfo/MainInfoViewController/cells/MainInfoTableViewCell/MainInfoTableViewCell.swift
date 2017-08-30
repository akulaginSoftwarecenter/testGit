//
//  MainInfoTableViewCell.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 29.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

class MainInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func updateCell(title: String) {
        self.title.text = title
    }
    
}

