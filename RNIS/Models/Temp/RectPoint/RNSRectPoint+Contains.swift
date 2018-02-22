//
//  RNSRectPoint+Contains.swift
//  RNIS
//
//  Created by Артем Кулагин on 25.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы со сравнением
 */
extension RNSRectPoint {
    
    func countains(_ point: PGGeoPoint?) -> Bool {
        self.searchPoint = point
        guard let point = point,
            let originalSpace = originalSpace,
            let veriticalSpace = self.veriticalSpace(point),
            let horizontalSpace = self.horizontalSpace(point) else {
                return false
        }
        let space = veriticalSpace + horizontalSpace
        return space < (originalSpace + 1)
    }
    
    func veriticalSpace(_ point: PGGeoPoint?) -> Double? {
        guard let left = spaceDeltaVertical(leftUpDistance, b: leftDownDistance),
            let right = spaceDeltaVertical(rightUpDistance, b: rightDownDistance)  else {
                return nil
        }
        return left + right
    }
    
    func horizontalSpace(_ point: PGGeoPoint?) -> Double? {
        guard let up = spaceDeltaHorizontal(leftUpDistance, b: rightUpDistance),
            let down = spaceDeltaHorizontal(leftDownDistance, b: rightDownDistance)  else {
                return nil
        }
        return up + down
    }
    
    func spaceDeltaVertical(_ a: Double?, b: Double?) -> Double? {
        return spaceDelta(a, b: b, c: verticalSide)
    }
    
    func spaceDeltaHorizontal(_ a: Double?, b: Double?) -> Double? {
        return spaceDelta(a, b: b, c: horizontalSide)
    }
    
    func spaceDelta(_ a: Double?, b: Double?, c: Double?) -> Double? {
        guard let a = a, let b = b, let c = c else {
            return nil
        }
        let p = (a + b + c)/2
        let sum = p * (p - a) * (p - b) * (p - c)
        return sqrt(sum)
    }
}
