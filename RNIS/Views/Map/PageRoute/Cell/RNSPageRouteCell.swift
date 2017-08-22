//
//  RNSPageRouteCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPageRouteCell: UICollectionViewCell {
    
    @IBOutlet weak var dotsBussView: RNSDotsBussView!
    
    var item: RNSRouteVariant? {
        didSet {
            reloadData()
        }
    }
    
    func reloadData() {
        dotsBussView.item = item
    }
}
