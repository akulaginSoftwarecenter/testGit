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
    
    var widthCell: CGFloat = 320;
    
    @IBOutlet var heightTableView: NSLayoutConstraint?
    
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
    
    func show() {
        prepareVisible(false)
    }
    
    func hidden() {
        prepareVisible(true)
    }
    
    func prepareVisible(_ isHidden: Bool) {
        self.isHidden = isHidden
        heightTableView?.isActive = !isHidden
    }
}
