//
//  RNSRouteTable+Move.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRouteTable {
    
    func randomDoneMove() {
        clearMove()
        let index = Int.rand(0, limit: points?.count ?? 0)
        print("randomDoneMove",index)
        for item in points?.prefix(index) ?? []  {
            item.doneMove = true
        }
    }
    
    func prepareDoneLocation() {
        
    }
    
    func clearMove() {
        points?.forEach{ $0.doneMove = false; $0.route?.doneMove = false }
    }
    
    func prepareMove() {
        items.prepareMove()
    }
}
