//
//  RNSAlertViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSAlertViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    static func controller(_ message: String?) -> RNSAlertViewController? {
        let vc = RNSAlertViewController.initialController as? RNSAlertViewController
        vc?.message = message
        return vc
    }
    
    var message: String?
    
    var titleOneButton: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageLabel.text = message
    }
    
    override class var storyboardName: String {
        return "RNSAlertViewController"
    }
    
    func addBtn(_ title: String? = "ОК") {
        let button = UIButton()
        button.titleLabel?.font = .cffazm22
        button.setTitle(title, for: UIControlState())
        button.backgroundColor = .EA4845
        button.touchUpInside { [weak self] in
            self?.dismiss(animated: false)
        }
        stackView.addArrangedSubview(button)
        button.snp.makeConstraints { (make) in
            make.height.equalTo(59)
            make.width.equalTo(stackView)
        }
    }
}
