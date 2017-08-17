//
//  RNSLocationManager+GeoCode.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
import CoreLocation

extension RNSLocationManager {
    
    static func geoCode(_ point: PGGeoPoint, complete: AliasStringBlock?) {
        CLGeocoder().reverseGeocodeLocation(point.location) {(placemarks, error) in
            if (error != nil) {
                //print("reverse geodcode fail: \(error!.localizedDescription)")
                complete?(nil)
            }
            let pm = placemarks! as [CLPlacemark]
            if pm.count > 0 {
                let pm = placemarks![0]
                /*
                print(pm.country as Any)
                print(pm.locality as Any)
                print(pm.subLocality as Any)
                print(pm.thoroughfare as Any)
                print(pm.postalCode as Any)
                print(pm.subThoroughfare as Any)
                 */
                var address = String()
                
                if let thoroughfare = pm.thoroughfare {
                    address = address + thoroughfare
                }
                
                if let subThoroughfare = pm.subThoroughfare {
                    address = address + ", " + subThoroughfare
                }
                //print(address)
                complete?(address)
            }
        }
    }
    
    static func geoCodeMylocation(complete: AliasStringBlock?) {
        geoCode(point, complete: complete)
    }
    /*
    static func geoCodeTone(_ point: PGGeoPoint, complete: AliasStringBlock?) {
        let lat = point.latitude
        let lon = point.longitude

        let url = "http://95.213.205.92/search/?a=geocode&lat=\(lat)&lon=\(lon)&is_addr=1&n=1"
    }
    
    */
    
    /*
    +(void)requestAddressWithLatitude:(double)lat longitude:(double)lon completion:(void(^)(NSString *address, Error *error))completion {
    //
    NSString *url = [NSString stringWithFormat:@"http://95.213.205.92/search/?a=geocode&lat=%f&lon=%f&is_addr=1&n=1", lat, lon];
    [[Server getInstance] GETrequestWithUrl:url parametrs:nil succes:^(NSDictionary *response) {
    //
    if (response && [response isKindOfClass:[NSDictionary class]]) {
    //
    NSArray *result = [response objectForKey:@"res"];
    if (result && [result isKindOfClass:[NSArray class]]) {
    //
    id firstResult = result.firstObject;
    if (firstResult && [firstResult isKindOfClass:[NSDictionary class]]) {
    //
    NSString *addr = [firstResult objectForKey:@"addr"];
    if (addr && [addr isKindOfClass:[NSString class]]) {
    //
    if (completion) {
    //
    completion(addr, nil);
    return;
    }
    }
    }
    }
    }
    //
    if (completion) {
    //
    Error *error = [Error new];
    error.errorMessage = @"Не удалось распарсить ответ сервера";
    completion(nil, error);
    }
    //
    } failed:^(Error *error) {
    //
    if (completion) {
    //
    completion(nil, error);
    }
    }];
    }
    */
}
