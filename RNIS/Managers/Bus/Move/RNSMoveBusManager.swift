//
//  RNSMoveBusManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 26.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSMoveBusManager: NSObject {
    
    /// переменная синглетона
    static let shared = RNSMoveBusManager()
   
    static var queue: OperationQueue {
        return shared.queue
    }
    
    static func reset() {
        queue.cancelAllOperations()
    }
    
    lazy var queue: OperationQueue = {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        queue.qualityOfService = .background
        return queue
    }()
}
