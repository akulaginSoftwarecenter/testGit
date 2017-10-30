//
//  NewsViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

/**
 Контроллер новостей
 */
class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var items: [RNSNewsTemp]?
    
    lazy var loaderView: LoaderView = {
        let view = LoaderView()
        view.isUserInteractionEnabled = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
    }
    
    func loadItems() {
        loaderView.showInView(view)
        RNSPostNews { [weak self] items in
           self?.prepareItems(items)
        }
    }
    
    func prepareItems(_ items: [RNSNewsTemp]?) {
        self.items = items
        tableView.reloadData()
        loaderView.remove()
    }

    override class var storyboardName: String {
        return "NewsViewController"
    }
}
