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

class ContactsInfoModel: NSObject {
    
    var contactType: Int!
    var contactTitle: String!
    var contactDescr: String!
    
}

class ContactsInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var testArray: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Полезные контакты"
        
        self.testArray = NSMutableArray()
        
        for i in 0...5 {
            let model = ContactsInfoModel()
            if i % 2 == 0 {
                model.contactType = contactType.contactTypePhone.rawValue
                model.contactTitle = "Номер службны находок (Выборгский район)"
                model.contactDescr = "+7 (931) 305-17-68"
            } else {
                model.contactType = contactType.contactTypeEmail.rawValue
                model.contactTitle = "Почта службы находок (Выборгский район)"
                model.contactDescr = "trsaltn@yandex.ru"
            }
            self.testArray.add(model)
        }
        
        self.tableView.tableFooterView = UIView();
        self.tableView.register(UINib.init(nibName: "ContactsInfoTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ContactsInfoTableViewCell")
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
    }

    //MARK: UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.testArray.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension >= 64 ? UITableViewAutomaticDimension : 64
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 87
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsInfoTableViewCell", for: indexPath) as! ContactsInfoTableViewCell;
        let model = self.testArray[indexPath.row] as! ContactsInfoModel
        cell.updateCell(model: model)
        return cell
    }
    
    //MARK: UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
    
    //MARK: Others methods
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
