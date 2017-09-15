//
//  RNSSearchViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSSearchViewController: UIViewController {
    
    @IBOutlet weak var textField: RNSTextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var items = [RNSTextItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareSegmented()
        checkSaved()
    }
    
    func checkSaved() {
        prepareSegment(RNSSearchManager.type ?? .transport)
        guard let text = RNSSearchManager.text, !text.isEmpty else {
            return
        }
        textField.text = text
        updateSearch()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override class var storyboardName: String {
        return "RNSSearchViewController"
    }
    
    deinit {
        print("RNSSearchViewController deinit")
    }
}
