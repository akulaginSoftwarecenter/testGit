//
//  StrelkaViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

class StrelkaViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    let host = "https://strelkacard.ru/"
    
    lazy var loaderView: LoaderView = {
        let view = LoaderView()
        view.isUserInteractionEnabled = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        loadStart()
        prepareHandlers()
    }
    
    func loadStart() {
        loaderView.showInView(self.view)
        webView.loadRequest(URLRequest(url: URL(string: host)!))
    }
    
    func resetIfNeed() {
        if host != webView.request?.url?.absoluteURL.absoluteString {
            loadStart()
        }
    }
    
    func prepareHandlers() {
        RNSMenuManager.handlerStrelkaUpdate = { [weak self] in
            self?.resetIfNeed()
        }
    }
 
    override class var storyboardName: String {
        return "StrelkaViewController"
    }
}
