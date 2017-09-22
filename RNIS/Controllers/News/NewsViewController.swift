//
//  NewsViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.loadRequest(URLRequest(url: URL(string: "https://dev-rnisportal.regeora.ru/")!))
    }

    override class var storyboardName: String {
        return "NewsViewController"
    }
}
