//
//  TransportViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}

class TransportViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : UIFont(name: "Cffazmiakhaddpiofffvylaqekz", size: 24.5)!,
                                                                        NSForegroundColorAttributeName : UIColor.white]
        
        self.navigationItem.title = "Мой транспорт"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
        self.tableView.tableFooterView = UIView();
        self.tableView.register(UINib.init(nibName: "MyTransportTopCell", bundle: Bundle.main), forCellReuseIdentifier: "MyTransportTopCell")
        self.tableView.register(UINib.init(nibName: "MyTransportCell", bundle: Bundle.main), forCellReuseIdentifier: "MyTransportCell")
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.segmentControl.selectedSegmentIndex = 0
        self.segmentControlAction(self.segmentControl)
        
    }
    
    //MARK: UITableViewDataSource Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if self.segmentControl.selectedSegmentIndex == 0 {
            return 2
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.segmentControl.selectedSegmentIndex == 0 {
            if section == 0 {
                return 3
            } else {
                return 2
            }
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = UIColor.white
        header.textLabel?.font = UIFont(name: "Cffazmiakhaddpiofffvylaqekz", size: 20)!
        header.textLabel?.frame = header.frame
        header.textLabel?.textAlignment = .left
        header.contentView.backgroundColor = UIColor(hex: "EA4C44")
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if self.segmentControl.selectedSegmentIndex == 0 {
            if section == 0 {
                return "Рядом с вами"
            } else {
                return "Далеко"
            }
        } else {
            return "Рядом с вами"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.segmentControl.selectedSegmentIndex == 0 {
            if indexPath.row == 0 {
                return 34
            }
            return 46
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.segmentControl.selectedSegmentIndex == 0 {
            if indexPath.section == 0 {
                if indexPath.row == 0 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "MyTransportTopCell", for: indexPath) as! MyTransportTopCell
                    cell.addressLabel.text = "Ул. Петроградская"
                    return cell;
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "MyTransportCell", for: indexPath) as! MyTransportCell
                    cell.transportNumber.text = "212"
                    cell.transportTime.text = "5 мин."
                    return cell;
                }
            } else {
                if indexPath.row == 0 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "MyTransportTopCell", for: indexPath) as! MyTransportTopCell
                    cell.addressLabel.text = "Ул. Ленина"
                    return cell;
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "MyTransportCell", for: indexPath) as! MyTransportCell
                    cell.transportNumber.text = "362"
                    cell.transportTime.text = "Каждые 8 мин."
                    cell.transportNumber.backgroundColor = UIColor.clear
                    cell.transportNumber.alpha = 0.7
                    return cell;
                }
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyTransportTopCell", for: indexPath) as! MyTransportTopCell
            return cell;
        }
    }
    
    //MARK: Actions
    @IBAction func segmentControlAction(_ sender: UISegmentedControl) {
        if self.segmentControl.selectedSegmentIndex == 0 {
            
        } else {
            
        }
        self.tableView.reloadData()
    }
    
    //MARK: Others Methods
    
    override class var storyboardName: String {
        return "TransportViewController"
    }
}
