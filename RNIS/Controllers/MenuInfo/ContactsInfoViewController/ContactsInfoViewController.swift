//
//  ContactsInfoViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 29.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

enum contactType: Int {
    case contactTypePhone = 0
    case contactTypeEmail = 1
}

class ContactsInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var testArray = [ContactsInfoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Полезные контакты"
        
        for i in 0...5 {
            let model = ContactsInfoModel()
            if i % 2 == 0 {
                model.contactType = contactType.contactTypePhone
                model.contactTitle = "Номер службны находок (Выборгский район)"
                model.contactDescr = "+7 (913) 629-86-58"
            } else {
                model.contactType = contactType.contactTypeEmail
                model.contactTitle = "Почта службы находок (Выборгский район)"
                model.contactDescr = "trsaltn@yandex.ru"
            }
            self.testArray.append(model)
        }
        
        self.tableView.tableFooterView = UIView();
        self.tableView.register(UINib.init(nibName: "ContactsInfoTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ContactsInfoTableViewCell")
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
    }
}
