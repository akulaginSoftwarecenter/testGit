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
     
        prepareNav()
        loadStart()
        prepareHandlers()
    }
    
    func prepareNav() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : UIFont(name: "Cffazmiakhaddpiofffvylaqekz", size: 24.5)!,
                                                                        NSForegroundColorAttributeName : UIColor.white]
        
        self.navigationItem.title = kStrelka 
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
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
