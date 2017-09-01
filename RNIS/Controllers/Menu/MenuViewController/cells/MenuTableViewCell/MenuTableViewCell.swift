//
//  MenuTableViewCell.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!

    func updateCell(title: String!, image: UIImage!) {
        self.cellTitle.text = title
        self.cellImageView.image = image
    }
}
