//
//  RNSTransportTableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSTransportTableView: BaseViewWithXIBInit {

    var items: [RNSDotsVerticalModel]? {
        didSet {
            updateUI()
        }
    }
    @IBOutlet var tableView: RNSRegisterTableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.contentInset = UIEdgeInsetsMake(27, 0, 0, 0);
    }
    
    func updateUI() {
        tableView.reloadData()
    }
    
    func generate() {
        items = [RNSDotsVerticalModel.generate()]
    }
}
