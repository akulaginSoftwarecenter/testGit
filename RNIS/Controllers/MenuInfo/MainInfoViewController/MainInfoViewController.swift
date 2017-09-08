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
    
    //MARK: UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "main_to_contacts", sender: self)
            break;
        case 1:
            self.performSegue(withIdentifier: "main_to_lostThings", sender: self)
            break;
        case 2:
            self.performSegue(withIdentifier: "main_to_qrScanner", sender: self)
            break;
        case 3:
            self.performSegue(withIdentifier: "main_to_report", sender: self)
            break;
        case 4:
            self.performSegue(withIdentifier: "main_to_support", sender: self)
            break;
        case 7:
            self.performSegue(withIdentifier: "main_to_aboutApp", sender: self)
            break;
        case 5:
            self.performSegue(withIdentifier: "main_to_docsInfo", sender: 5);
            break;
        case 6:
            self.performSegue(withIdentifier: "main_to_docsInfo", sender: 6);
            break;
        default:
            break;
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "main_to_docsInfo",
            let send = sender as? Int {
            let docsInfoVC = segue.destination as? DocsInfoViewController
            docsInfoVC?.type = send == 5 ? .userGuide : .termOfUse
        }
    }
    
    override class var storyboardName: String {
        return "MenuInfo"
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        STRouter.revertLogin()
    }
}
