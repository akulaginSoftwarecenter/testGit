//
//  RNSPageRouteCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPageRouteCell: UICollectionViewCell {
    
    @IBOutlet weak var labelDurations: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelCount: UILabel!
    @IBOutlet weak var dotsBussView: RNSDotsBussView!
    @IBOutlet weak var blackButton: RNSBlackButton!
    
    var item: RNSRouteVariant? {
        didSet {
            reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        blackButton.handlerAction = { [weak self] in
            self?.showDetail()
        }
    }
    
    func showDetail() {
        RNSRouteDetailController.initController(item?.tableItem)?.pushAnimatedRed()
    }
}
