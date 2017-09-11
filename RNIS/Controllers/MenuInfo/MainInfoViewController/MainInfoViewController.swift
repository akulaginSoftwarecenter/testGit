//
//  MainInfoViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 29.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

class MainInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView: UITableView!
    
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
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : UIFont(name: "Cffazmiakhaddpiofffvylaqekz", size: 24.5)!,
                                                                        NSForegroundColorAttributeName : UIColor.white]
        
        self.navigationItem.title = "Информация";
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
        self.tableView.contentInset = UIEdgeInsetsMake(16, 0, 0, 0);
        self.tableView.tableFooterView = UIView();
        self.tableView.register(UINib.init(nibName: "MainInfoTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "MainInfoTableViewCell")
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
    }
    //MARK: UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuTitles.count;
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension >= 54 ? UITableViewAutomaticDimension : 54
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainInfoTableViewCell", for: indexPath) as! MainInfoTableViewCell;
        cell.updateCell(title:menuTitles[indexPath.row]);
        return cell
    }
    
    let main_to_contacts = "main_to_contacts"
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let row = indexPath.row
        switch indexPath.row {
        case 0,1:
            self.performSegue(withIdentifier: main_to_contacts, sender: row)
            break;
        case 2:
            self.performSegue(withIdentifier: "main_to_qrScanner", sender: self)
            break;
        case 3:
            ReportInfoViewController.initialController.pushAnimatedRedScroll()
            break;
        case 4:
            SupportInfoViewController.initialController.pushAnimatedRedScroll()
            break;
        case 7:
            self.performSegue(withIdentifier: "main_to_aboutApp", sender: self)
            break;
        case 5:
            showDocsInfo(.userGuide)
            break;
        case 6:
            showDocsInfo(.termOfUse)
            break;
        default:
            break;
        }
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
    
    @IBAction func actionLogin(_ sender: Any) {
        STRouter.revertLogin()
    }
}
