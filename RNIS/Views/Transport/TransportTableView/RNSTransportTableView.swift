//
//  RNSTransportTableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSTransportTableView: BaseViewWithXIBInit {

    var items: [RNSRouteVariant]?
    
    @IBOutlet var tableView: RNSRegisterTableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        tableView.contentInset = UIEdgeInsetsMake(27, 0, 0, 0);
        prepareHandlers()
    }
    
    func prepareHandlers() {
        RNSPageRouteManager.handlerUpdateFavorite = { [weak self] in
            self?.updateUI()
        }
    }
    
    func updateUI() {
        RNSPostFavoritePathList {[weak self] (reply, error, _) in
            self?.items = reply as?[RNSRouteVariant]
            self?.tableView.reloadData()
        }
    }
}
