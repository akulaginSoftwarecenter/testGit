//
//  RNSSupportTextView+TextView.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с полем ввода
 */
extension RNSSupportTextView: UITextViewDelegate {
    public func textViewDidChange(_ textView: UITextView) {
        updateHeightTextView()
    }
    
    func updateHeightTextView() {
       // UIView.animateConstrains(self) {
            let size = self.textView.sizeThatFits(CGSize(width: self.textView.bounds.width, height: CGFloat.greatestFiniteMagnitude))
            self.textViewHeightConstraint.constant = size.height
       // }
    }
}
