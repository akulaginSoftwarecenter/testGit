//
//  SupportInfoViewController+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension SupportInfoViewController {
    /*
    public func textViewDidChange(_ textView: UITextView) {
        updateHeightTextView()
    }
    
    func updateHeightTextView() {
        UIView.animateConstrains(self.view) {
            let size = self.textView.sizeThatFits(CGSize(width: self.textView.bounds.width, height: CGFloat.greatestFiniteMagnitude))
            self.textViewHeightConstraint.constant = size.height
        }
    }
    */
    func prepareUI() {
        topTitle.text = type.rawValue
        
        blackButton.handlerAction = { [weak self] in
            self?.checkValidFields()
        }
        prepareMessage()
    }
     
    func prepareError(_ error: String?) {
        errorLabel.text = error
    }
    
    func prepareMessage() {
        messageView.text = message
    }
}
