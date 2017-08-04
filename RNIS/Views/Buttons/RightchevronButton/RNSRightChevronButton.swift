//
//  RNSRightchevronButton.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import SnapKit

class RNSRightChevronButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "chevronRight"))
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(self)
        }
    }
}
