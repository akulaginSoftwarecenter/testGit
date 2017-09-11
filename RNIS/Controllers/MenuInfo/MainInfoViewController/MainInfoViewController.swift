//
//  MainInfoViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 29.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

class MainInfoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let main_to_contacts = "main_to_contacts"
    
    let menuTitles = ["Полезные контакты",
                      "Забытые вещи",
                      "Сканер QR",
                      "Пожаловаться",
                      "Связь с разработчиком" ,
                      "Руководство пользователя",
                      "Пользовательское соглашение",
                      "О приложении"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareNav()
        tableView.contentInset = UIEdgeInsetsMake(16, 0, 0, 0);
    }
    
    func prepareNav() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.barTintColor = .F1645A
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : UIFont(name: "Cffazmiakhaddpiofffvylaqekz", size: 24.5)!,
                                                                        NSForegroundColorAttributeName : UIColor.white]
        
        navigationItem.title = "Информация";
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
    
    func showDocsInfo(_ type: RNSDocsType) {
        let vc = DocsInfoViewController.initialController as? DocsInfoViewController
        vc?.type = type
        vc?.pushAnimatedRed()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == main_to_contacts,
            let send = sender as? Int {
            let vc = segue.destination as? ContactsInfoViewController
            vc?.type = send == 0 ? .contact : .forgotten
        }
    }
    
    override class var storyboardName: String {
        return "MenuInfo"
    }
}
