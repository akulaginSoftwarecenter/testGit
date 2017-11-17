//
//  STAlertRouter.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class STAlertRouter: NSObject {
    
    static var showedUuids = [String]()
    
    static func removeAlert(_ uuid: String?) {
        guard let uuid = uuid,
            let index = showedUuids.index(of: uuid) else {
            return
        }
        showedUuids.remove(at: index)
    }
    
    static func addAlert(_ uuid: String?) {
        guard let uuid = uuid else {
                return
        }
        showedUuids.append(uuid)
    }
    
    static func isAlertExist(_ uuid: String?) -> Bool {
        guard let uuid = uuid else {
            return false
        }
        return showedUuids.contains(uuid)
    }
    
    static func present(_ viewControllerToPresent:UIViewController?, animated: Bool = true, completion: EmptyBlock? = nil) {
        STRouter.present(viewControllerToPresent, animated: animated, completion: completion)
    }
}
