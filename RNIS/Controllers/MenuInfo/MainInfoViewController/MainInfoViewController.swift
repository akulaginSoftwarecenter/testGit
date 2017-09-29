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
        
        tableView.contentInset = UIEdgeInsetsMake(16, 0, 0, 0);
    }

    func showDocsInfo(_ type: RNSDocsType) {
        let vc = DocsInfoViewController.initialController as? DocsInfoViewController
        vc?.type = type
        vc?.pushAnimatedRed()
    }
    
    func showContact(_ type: RNSContactInfoType) {
        let vc = ContactsInfoViewController.initialController as? ContactsInfoViewController
        vc?.type = type
        vc?.pushAnimatedRed()
    }
    
    func showPetition(_ type: RNSPetitionType = .feedback) {
        let vc = SupportInfoViewController.initialController as? SupportInfoViewController
        vc?.type = type
        vc?.pushAnimatedRedScroll()
    }
    
    override class var storyboardName: String {
        return "MainInfoViewController"
    }
}
