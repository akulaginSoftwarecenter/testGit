//
//  RNSSearchView.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSSearchView: BaseViewWithXIBInit {
    var items: [RNSTextItem]?
    
    /// Поисковый запрос на сервер
    var request: AlamofireAPI?
    var text: String?
    var typeSegment: TypeSearch = .address
    
    @IBOutlet weak var heightTableView: NSLayoutConstraint!
    
    var handlerLoader: AliasBoolBlock?
    var handlerError: AliasStringBlock?
    var handlerShowItem: ((RNSTextItem?) -> ())?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    }
    
    func showItem(_ item: RNSTextItem?) {
        handlerShowItem?(item)
    }
}
