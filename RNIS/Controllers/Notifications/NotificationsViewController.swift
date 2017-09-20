//
//  NotificationsViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

class NotificationModel: NSObject {
    
    var autoNumber: String!
    var street: String!
    var time: String!
    
}

class NotificationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var testArray: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : UIFont(name: "Cffazmiakhaddpiofffvylaqekz", size: 24.5)!,
                                                                        NSForegroundColorAttributeName : UIColor.white]
        
        self.navigationItem.title = "Оповещения"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
        self.testArray = NSMutableArray()
        
        for i in 0...5 {
            let model = NotificationModel()
            if i % 2 == 0 {
                model.autoNumber = "A557"
                model.street = "Лиговский проспект 22"
                model.time = "60 мин."
            } else {
                model.autoNumber = "A96"
                model.street = "Улица Петроградская"
                model.time = "20 мин."
            }
            self.testArray.add(model)
        }
        
        self.tableView.tableFooterView = UIView();
        self.tableView.register(UINib.init(nibName: "NotificationTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "NotificationTableViewCell")
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
    }

    //MARK: UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.testArray.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension// >= 66 ? UITableViewAutomaticDimension : 66
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell;
        let model = self.testArray[indexPath.row] as! NotificationModel
        cell.updateCell(model: model)
        return cell
    }
    
    //MARK: UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        NotificationsSettingsViewController.initialPushAnimatedRed()
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
    }
    
    override class var storyboardName: String {
        return "NotificationsViewController"
    }
}
