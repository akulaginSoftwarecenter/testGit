//
//  RNSFavoritesBusView.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

struct TableSection {
    let title: String?
    var items: [RNSFavoriteStopPoint]?
}

class RNSFavoritesBusView: BaseViewWithXIBInit {
    
    lazy var loaderView: LoaderView = LoaderView()
    var sections: [TableSection] {
        return [TableSection(title: "Рядом с вами", items: self.items)]
    }
    
    var items: [RNSFavoriteStopPoint]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.contentInset = UIEdgeInsetsMake(27, 0, 0, 0);
         prepareHandlers()
    }
    
    func prepareHandlers() {
        RNSMenuManager.handlerUpdateFavoriteBuss = {[weak self] in
            self?.loadData()
        }
    }
    
    func loadData() {
        loaderView.showInView(self)
        RNSPostFavoriteRouteList {[weak self] (reply, error, _) in
            self?.loaderView.remove()
            self?.items = reply as? [RNSFavoriteStopPoint]
            self?.tableView.reloadData()
        }
    }
}
