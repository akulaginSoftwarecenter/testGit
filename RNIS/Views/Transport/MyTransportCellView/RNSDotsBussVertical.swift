//
//  RNSMyTransportCellView.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSDotsBussVertical: BaseViewWithXIBInit {

    @IBOutlet weak var tableView: RNSRegisterTableView!
    @IBOutlet weak var durationLabel: UILabel!
    
    var items: [RNSVerticalTableItem] {
        return dotsVerticalModel?.items ?? []
    }
    
    var item: RNSRouteVariant? {
        didSet {
           dotsVerticalModel = item?.dotsVerticalModel
           updateUI()
        }
    }
    
    var dotsVerticalModel: RNSDotsVerticalModel?
    
    func updateUI() {
        tableView.reloadData()
        durationLabel.text = dotsVerticalModel?.duration
    }
}
