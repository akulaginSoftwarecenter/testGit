//
//  RNSPageRouteCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Ячейка коллекции которая показывает информацию об одном из варинато маршрута
 */
class RNSPageRouteCell: UICollectionViewCell {
    
    @IBOutlet weak var labelDurations: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelCount: UILabel!
    @IBOutlet weak var dotsBussView: RNSDotsBussView!
    
    /// главная переменная инициализации варианта маршрута
    var item: RNSRouteVariant? {
        didSet {
            reloadData()
        }
    }
}
