//
//  DocsInfoViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

enum RNSDocsType: String {
    case userGuide = "guide"
    case termOfUse = "agreement"
}

/**
 DocsInfoViewController
 */

class DocsInfoViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    var type: RNSDocsType = .userGuide
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadText()
    }
    
    func loadText() {
        titleLabel.text = type == .userGuide ? "Руководство пользователя" : "Пользовательское соглашение"
        
        RNSPostMobilePageGet(type, complete: { [weak self] (item) in
            self?.prepareText(item?.text)
        }) { [weak self] (error) in
            self?.prepareText(error)
        }
    }
    
    func prepareText(_ text: String?) {
        textView.text = text
    }
    
    override class var storyboardName: String {
        return "DocsInfoViewController"
    }
    @IBAction func actionBack(_ sender: Any) {
        STRouter.pop()
    }
}
