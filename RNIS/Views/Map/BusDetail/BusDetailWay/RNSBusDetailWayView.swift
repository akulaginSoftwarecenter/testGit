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
    
    var items: List<RNSBusStop>? {
        return item?.busStops
    }
    
    var item: RNSBus?{
        didSet{
            reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        registerCell()
    }
    
    func registerCell() {
        tableView.register(RNSBusDetailWayCell.self)
    }
    
    func reloadData() {
        tableView.reloadData()
        heightTableView.constant = tableView.tableViewContentSize
    }
}
