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
        prepareMoveAtIndex(index)
    }
    
    func prepareDoneLocation() {
        clearMove()
        guard let nearPoints = self.pairNearPoints else {
            return
        }
        
        let first = nearPoints.first
        let last = nearPoints.last
        if isLast(last),
            let between = self.distanceBetween(nearPoints),
            let distanceFirst = first?.distanceToCurrent,
            distanceFirst > between  {
            prepareMoveAtPoint(last)
        }
        prepareMoveAtPoint(first)
    }
    
    func prepareMoveAtPoint(_ point: RNSRoutePoint?) {
        let index = indexAtPoint(point)
        prepareMoveAtIndex(index)
    }
    
    func prepareMoveAtIndex(_ index: Int?) {
        //print("prepareMoveAtIndex",index)
        for item in points?.prefix((index ?? 0) + 1) ?? []  {
            item.doneMove = true
        }
    }
    
    func clearMove() {
        points?.forEach{ $0.doneMove = false; $0.route?.doneMove = false }
    }
    
    func prepareMove() {
        items.prepareMove()
    }
    
    
    func pointIndex(_ index: Int?) -> RNSRoutePoint? {
        return points?.valueAt(index)
    }
    
    func distanceBetween(_ pair: AliasPair) -> CLLocationDistance? {
        return pair.first?.distanceTo(pair.last)
    }
    
    func isLast(_ point: RNSRoutePoint?)  -> Bool {
        guard let points = points,
            let ind = indexAtPoint( point) else {
                return false
        }
        
        return (points.count - 1) == ind
    }
    
    func indexAtPoint(_ point: RNSRoutePoint?) -> Int? {
        guard let point = point else {
            return nil
        }
        return points?.index(of: point)
     }
}
