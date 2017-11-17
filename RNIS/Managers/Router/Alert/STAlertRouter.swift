//
//  STAlertRouter.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class STAlertRouter: NSObject {
    static func present(_ viewControllerToPresent:UIViewController?, animated: Bool = true, completion: EmptyBlock? = nil) {
        STRouter.present(viewControllerToPresent, animated: animated, completion: completion)
    }
}
