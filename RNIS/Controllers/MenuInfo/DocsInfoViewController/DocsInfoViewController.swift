//
//  DocsInfoViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

enum vcType: Int {
    case userGuide = 0
    case termOfUse = 1
}

class DocsInfoViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    var docsInfoVCType: Int!
    
    let userGuideText = "Текст руководста пользователя, раз два три четыре пять шесть семь восемь"
    let termOfUseText = "Текст пользовательского соглашения, раз два три четыре пять шесть семь восемь"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.docsInfoVCType == vcType.userGuide.rawValue {
            self.navigationItem.title = "Руководство пользователя"
            self.textView.text = self.userGuideText;
        } else {
            self.navigationItem.title = "Пользовательское соглашение";
            self.textView.text = self.termOfUseText;
        }
        
    }
    
    //MARK: Others methods
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
