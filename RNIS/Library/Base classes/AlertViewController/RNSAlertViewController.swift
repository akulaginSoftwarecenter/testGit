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
    @IBOutlet weak var messageView: UIView!
    
    var handlerViewDidLoad: EmptyBlock?
    
    static func controller(_ message: String?) -> RNSAlertViewController? {
        let vc = RNSAlertViewController.initialController as? RNSAlertViewController
        vc?.message = message
        return vc
    }
    
    var message: String?
    
    var titleOneButton: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handlerViewDidLoad?()
        prepareUI()
    }
    
    func prepareUI() {
        messageLabel.text = message
        messageView.backgroundColor = .EA4845
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        messageView.roundTopCorners()
    }
    
    func addBtn(_ title: String? = "ОК") {
        let button = RNSOneBtnAlert(title)
        button.touchUpInside { [weak self] in
            self?.dismiss()
        }
        stackView.addArrangedSubview(button)
        button.snp.makeConstraints { (make) in
            make.width.equalTo(stackView)
        }
    }
    
    func addBtns(_ leftTitle: String? = "OK", _ rightTitle: String? = "ОТМЕНА", handlerOk: EmptyBlock? = nil) {
        let view = RNSTwoBtnAlert(leftTitle, rightTitle)
        view.handlerLeft = { [weak self] in
            self?.dismiss(completion: handlerOk)
        }
        view.handlerRight = { [weak self] in
            self?.dismiss()
        }
        stackView.addArrangedSubview(view)
        view.snp.makeConstraints { (make) in
            make.width.equalTo(stackView)
        }
    }
    
    func dismiss(completion: EmptyBlock? = nil) {
        dismiss(animated: true, completion: completion)
    }
    
    deinit {
        print("RNSAlertViewController deinit")
    }
   
    override class var storyboardName: String {
        return "RNSAlertViewController"
    }
}
