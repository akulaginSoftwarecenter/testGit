//
//  RNSBusDetailWayView.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import RealmSwift

class RNSBusDetailWayView: BaseViewWithXIBInit {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var heightTableView: NSLayoutConstraint!
    
    var items: [RNSBusTableItem]? {
        return tableModel?.itemsStill
    }
    
    var tableModel: RNSBusTableModel? {
        didSet {
            reloadData()
        }
    }
    
    var item: RNSBusTemp?{
        didSet {
            tableModel = item?.tableModel
        }
    }

    func reloadData() {
        tableView.reloadData()
        heightTableView.constant = tableView.tableViewContentSize
    }
    
    func animateInsertStill(_ indexPath: IndexPath) {
        guard let item = self.item(indexPath) else {
            return
        }
        let indexPaths = item.indexPatchs(indexPath)
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .fade)
        if item.openStill {
            tableView.insertRows(at: indexPaths, with: .bottom)
        } else {
            tableView.deleteRows(at: indexPaths, with: .top)
        }
        tableView.endUpdates()
        self.heightTableView.constant = self.tableView.tableViewContentSize
    }
}
