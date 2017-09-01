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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : UIFont(name: "Cffazmiakhaddpiofffvylaqekz", size: 24.5)!,
                                                                        NSForegroundColorAttributeName : UIColor.white]
        
        self.navigationItem.title = "Стрелка"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
        self.webView.loadRequest(URLRequest(url: URL(string: "https://strelkacard.ru/")!))
    }

    override class var storyboardName: String {
        return "StrelkaViewController"
    }
}
