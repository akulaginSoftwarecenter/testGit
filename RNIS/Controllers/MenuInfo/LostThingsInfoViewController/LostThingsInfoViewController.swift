//
//  LostThingsInfoViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

class LostThingsInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var testArray = [ContactsInfoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Забытые вещи"
        
        for i in 0...5 {
            let model = ContactsInfoModel()
            if i % 2 == 1 {
                model.contactType = .contactTypePhone
                model.contactTitle = "Номер службны находок (Выборгский район)"
                model.contactDescr = "+7 (931) 305-17-68"
            } else {
                model.contactType = .contactTypeEmail
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
    
    //MARK: UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.testArray.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension >= 64 ? UITableViewAutomaticDimension : 64
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsInfoTableViewCell", for: indexPath) as! ContactsInfoTableViewCell;
        cell.updateCell(item(indexPath))
        return cell
    }
    
    //MARK: UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        item(indexPath)?.callOrSend()
    }
    
    func item(_ indexPath: IndexPath) -> ContactsInfoModel? {
        return testArray[indexPath.row]
    }
    
    //MARK: Others methods
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
