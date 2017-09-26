//
//  RNSFavoritesBusCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSFavoritesBusCell: RNSBaseTableCell {

    var didTapDelete: ((RNSBusStopTemp) -> ())?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topTitle: UILabel!
    
    var item: RNSBusStopTemp! {
        didSet {
            updateUI()
        }
    }

    var items: [RNSRouteBusTemp]? {
        return item?.forecast
    }
    
    func updateUI() {
        topTitle.text = item?.name ?? ""
        tableView.reloadData()
    }
    @IBAction func deleteBusStopAction(_ sender: Any) {
        self.didTapDelete?(item)
    }
}
