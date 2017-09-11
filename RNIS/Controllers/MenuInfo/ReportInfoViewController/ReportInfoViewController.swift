//
//  ReportInfoViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

class ReportInfoViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Пожаловаться"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }

    @IBAction func actionButton(_ sender: Any) {
        prepareError(nil)
        guard let body = textView.text, !body.isEmpty else {
            prepareError("Заполните текст обращения")
            return
        }
        
        RNSPostComplaint(body) { [weak self]  _ in
            self?.showAlert()
        }
    }
    
    func showAlert() {
        STRouter.showAlertOk("Ваше сообщение отправлено!") { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    func prepareError(_ error: String?) {
        errorLabel.text = error
    }
    
    override class var storyboardName: String {
        return "ReportInfoViewController"
    }
}
