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
        return item?.items ?? []
    }
    
    var item: RNSDotsVerticalModel? {
        didSet {
           updateUI()
        }
    }
    
    func updateUI() {
        tableView.reloadData()
        durationLabel.text = item?.duration
    }
}
