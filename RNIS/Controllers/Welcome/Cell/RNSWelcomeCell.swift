//
//  RNSWelcomeCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSWelcomeCell: UICollectionViewCell {
    
    @IBOutlet weak var imageStart: UIImageView!
    @IBOutlet weak var imageBack: UIImageView!
    
    var item: WelcomeItem? {
        didSet {
            updateItem()
        }
    }
    
    func updateItem() {
        guard let item = item else {
            return
        }
        imageStart.image = item.startImage
        imageBack.image = item.back
    }
}
