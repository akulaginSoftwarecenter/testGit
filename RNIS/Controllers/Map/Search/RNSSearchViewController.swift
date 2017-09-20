//
//  RNSSearchViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSSearchViewController: UIViewController, KeyboardShowable {
    
    var viewBottomHeightLayoutConstraint: NSLayoutConstraint? {
        get {
            return bottomConstraint
        }
    }
    
    var isNeedAddTap: Bool = false
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var textField: RNSTextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var items = [RNSTextItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareSegmented()
        checkSaved()
        tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
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
        addKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeAllObservers()
    }
    
    override class var storyboardName: String {
        return "RNSSearchViewController"
    }
    
    deinit {
        print("RNSSearchViewController deinit")
    }
}
