//
//  String+Utils.swift
//  Spytricks
//
//  Created by Артем Кулагин on 17.03.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import Foundation
import UIKit

extension String{
    var last10:String {
        return String(characters.suffix(10))
    }
}
