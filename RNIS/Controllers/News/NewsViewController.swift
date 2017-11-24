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
    
    lazy var loaderWay = RNSLoaderWay()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
        prepareHandlers()
    }
    
    func prepareHandlers() {
        RNSMenuManager.handlerNewsUpdate = { [weak self] in
            self?.loadItems()
        }
    }
    
    func loadItems() {
        loaderView.showInView(view)
        RNSPostNews(complete: { [weak self] items in
            self?.clearError()
            self?.prepareItems(items)
        }) { [weak self] text in
            self?.prepareError(text)
        }
    }
    
    func prepareError(_ text: String?) {
        loaderWay.showCenterError(self.view, frame: tableView.frame, text: text)
        prepareItems(nil)
    }
    
    func clearError() {
        loaderWay.remove()
    }
    
    func prepareItems(_ items: [RNSNewsTemp]?) {
        self.items = items
        tableView.reloadData()
        removeLoader()
    }
    
    func removeLoader() {
        loaderView.remove()
    }
}
