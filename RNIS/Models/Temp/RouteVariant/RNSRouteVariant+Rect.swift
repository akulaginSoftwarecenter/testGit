//
//  RNSRouteVariant+Rect.swift
//  RNIS
//
//  Created by Артем Кулагин on 25.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
import MapKit

/**
 Расширение для работы с областью
 */
extension RNSRouteVariant {
    
    var rects: [RNSRectPoint] {
        var rects = [RNSRectPoint]()
        guard let points = points else {
            return rects
        }
        for index in (0..<points.count - 1) {
            let point = points.valueAt(index)?.point
            let point2 = points.valueAt(index + 1)?.point
            let rect = RNSRectPoint(point, pointEnd: point2)
            rects.append(rect)
        }
        return rects
    }
    
    func containts(_ point: PGGeoPoint?) -> Bool {
        for rect in rects {
            if rect.countains(point) {
                return true
            }
        }
        return false
    }
    
    func prepareDisplayData() {
        guard let points = points,
            let first = points.first,
            let lat = first.latitude,
            let lon = first.longitude else {
                return
        }
        var minLat = lat
        var maxLat = lat
        var minLon = lon
        var maxLon = lon
        
        for item in points {
            guard let lat = item.latitude,
                let lon = item.longitude else {
                    continue
            }
            
            if lat < minLat {
                minLat = lat
            }
            
            if maxLat < lat {
                maxLat = lat
            }
            
            if lon < minLon {
                minLon = lon
            }
            
            if maxLon < lon {
                maxLon = lon
            }
        }
        
        let min = PGGeoPoint(latitude: minLat, longitude: minLon)
        let max = PGGeoPoint(latitude: maxLat, longitude: maxLon)
        
        maxSize = min.distanceTo(max)
        
        let centerLat = (maxLat + minLat)/2
        let centerLon = (maxLon + minLon)/2
        centerPoint = PGGeoPoint(latitude: centerLat, longitude: centerLon)
    }
     
    func prepareZoomIfPossible() {
        guard let size = maxSize,
            let zoom = RNSMapManager.zoomAtDistance(CGFloat(size)) else {
                return
        }
        RNSMapManager.setZoomLevel(zoom)
    }
    
    func prepareCenterIfPossible() {
        mapCenter(centerPoint)
    }
    
    func prepareDisplayMapFirst() {
        mapCenter(points?.first?.point)
    }
    
    func prepareDisplayMap() {
        prepareZoomIfPossible()
        prepareCenterIfPossible()
    }
    
    func mapCenter(_ point: PGGeoPoint?){
        RNSMapManager.mapCenter(point)
    }
}
