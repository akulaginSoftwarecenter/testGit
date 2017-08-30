//
//  MenuViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let menuTitles = ["Карта",
                      "Избранное",
                      "Оповещения",
                      "Новости",
                      "Настройки" ,
                      "Стрелка",
                      "Информация"];
    
    let menuImages = [UIImage.init(named: "menuMapIcon"),
                      UIImage.init(named: "menuStarIcon"),
                      UIImage.init(named: "menuBellIcon"),
                      UIImage.init(named: "menuNewspaperIcon"),
                      UIImage.init(named: "menuSettingsIcon"),
                      UIImage.init(named: "menuCreditcardIcon"),
                      UIImage.init(named: "menuInfoIcon")];
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
        self.profileImageView.layer.masksToBounds = true
        self.editButton.layer.cornerRadius = self.editButton.frame.width / 2
        
        self.tableView.tableFooterView = UIView();
        self.tableView.register(UINib.init(nibName: "MenuTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "MenuTableViewCell")
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
    }

    //MARK: UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuTitles.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell;
        cell.updateCell(title: self.menuTitles[indexPath.row], image: self.menuImages[indexPath.row])
        return cell
    }
    
    //MARK: UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    //MARK: Others Methods
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
