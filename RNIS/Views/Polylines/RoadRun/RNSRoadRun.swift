//
//  RNSRoadRun.swift
//  RNIS
//
//  Created by Артем Кулагин on 25.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRoadRun: PGPolyline {
    
    var polylines = [PGPolyline]()
    
    var points: [PGGeoPoint]?
    
    convenience init(_ points: [RNSRoutePoint]?) {
        self.init()
        
        self.points = points?.flatMap{$0.point}
        prepareLine()
        //prepareDots()
    }
    
    func prepareLine() {
        setLineWidth(5)
        setOutlineColor(.color13)
        setBorderWidth(1)
        preparePoints()
    }
    
    func preparePoints() {
        guard let points = points else {
            return
        }
        print("RNSRoadRun",points)
        addPoints(points, count: Int32(points.count), color: .red)
    }
    override func clear() {
        polylines.forEach{$0.clear()}
    }
    /*
    func prepareDots() {
        guard let points = points else {
            return
        }
        
        polylines.append(RNSDotRun(points.first))
    }
    
    override func clear() {
        polylines.forEach{ $0.clear()}
    }
    */
}
