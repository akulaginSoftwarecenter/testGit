//
//  UIStackView+Utils.swift
//  RNIS
//
//  Created by Артем Кулагин on 22.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension UIStackView {
    func removeArrangedSubviews() {
        for view in arrangedSubviews {
            removeArrangedSubview(view)
        }
    }
}
