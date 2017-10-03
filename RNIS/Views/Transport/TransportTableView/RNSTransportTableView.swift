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
    lazy var loaderView: LoaderView = LoaderView()
    
    override func awakeFromNib() {
        super.awakeFromNib()

        tableView.contentInset = UIEdgeInsetsMake(27, 0, 0, 0);
        prepareHandlers()
        prepareNotificationHandlers()
    }
    
    func prepareHandlers() {
        RNSPageRouteManager.handlerUpdateFavorite = { [weak self] in
            self?.updateUI()
        }
    }

    func prepareNotificationHandlers() {
        RNSPageRouteManager.handlerUpdateNotification = { [weak self] in
            self?.updateUI()
        }
    }
    
    func updateUI() {
        loaderView.showInView(self)
        print("updateUI RNSTransportTableView")
        RNSPostFavoritePathList {[weak self] (reply, error, _) in
            self?.loaderView.remove()
            self?.items = reply as?[RNSRouteVariant]
            self?.tableView.reloadData()
        }
    }
}
