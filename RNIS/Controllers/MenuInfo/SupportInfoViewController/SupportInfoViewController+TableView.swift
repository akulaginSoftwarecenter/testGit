//
//  SupportInfoViewController+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension SupportInfoViewController {
    public func textViewDidChange(_ textView: UITextView) {
        textViewHeightConstraint.constant = textView.contentSize.height + 5
    }
}
