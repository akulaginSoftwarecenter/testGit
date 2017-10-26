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

/**
 Контроллер отображения контактов
 */
class ContactsInfoViewController: UIViewController {
    @IBOutlet weak var topTitle: RNSTopTitle!

    @IBOutlet weak var tableView: UITableView!
    
    /// Тип контактов
    var type: RNSContactInfoType = .contact
    
    /// Массив моделей
    var items: [RNSContactItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topTitle.text = type.title
        loadItems()
        tableView.tableFooterView = UIView()
    }
    
    /// Загрузка контактов
    func loadItems() {
        RNSPostContactList(type, complete: { [weak self] item in
            self?.items = item?.items
            self?.tableView.reloadData()
        })
    }
    
    override class var storyboardName: String {
        return "ContactsInfoViewController"
    }
}
