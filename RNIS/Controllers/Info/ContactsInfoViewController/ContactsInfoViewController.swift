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
    lazy var loaderWay = RNSLoaderWay()
    
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
            self?.prepareItems(item?.items)
            self?.clearError()
            }, failure: { [weak self] text in
                self?.prepareError(text)
        })
    }
    
    func prepareError(_ text: String?) {
        loaderWay.showCenterError(self.view, frame: tableView.frame, text: text)
        prepareItems(nil)
    }
    
    func clearError() {
        loaderWay.remove()
    }
    
    func prepareItems(_ items: [RNSContactItem]?) {
        self.items = items
        tableView.reloadData()
    }
    
    override class var storyboardName: String {
        return "ContactsInfoViewController"
    }
}
