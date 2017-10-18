//
//  RNSFavoritesBusView.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Favorites Bus View
 */

struct TableSection {
    let title: String?
    var items: [RNSFavoriteStopPoint]?
}

class RNSFavoritesBusView: BaseViewWithXIBInit {
    
    lazy var loaderView: LoaderView = LoaderView()
    var sections = [TableSection]()
    
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
}
