//
//  ContactsInfoViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 29.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

enum RNSContactInfoType: String {
    case contact = "contact"
    case forgotten = "forgotten"
    
    var title: String {
        return self == .contact ? "Полезные контакты" : "Забытые вещи"
    }
}

class ContactsInfoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var type: RNSContactInfoType = .contact
    
    var items: [RNSContactItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = type.title
        view.backgroundColor = .F1645A
        loadItems()
        tableView.tableFooterView = UIView()
    }
    
    func loadItems() {
        RNSPostContactList(type, complete: { [weak self] item in
            self?.items = item?.items
            self?.tableView.reloadData()
        })
    }
}
