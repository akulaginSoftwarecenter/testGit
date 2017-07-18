//
//  PGMapViewDelegate.h
//  ProGorodLight
//
//  Created on 21.05.12.
//  Copyright (c) 2012 CDCOM. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PGOverlay.h"

@class PGOverlay, PGOverlayItem;

@protocol PGMapViewDelegate <NSObject>

@optional

#pragma mark MapView events
- (void) onOverlay:(PGOverlay*)overlay Item:(PGOverlayItem*)item;
- (void) onPoiMarker:(NSString*)info;
- (void) onGeoblogMarker:(int)eventid;
- (void) onMapEvent;
- (void) onMapTouchEvent:(PGGeoPoint)point;
- (void) onMapLongTouchEvent:(PGGeoPoint)point;
- (void) onTrafficInfoChanged;
- (void) onLocationChanged:(NSDictionary *)newLocationData;

#pragma mark Sensors events
- (void) onSensorChangedAzimuth:(CGFloat) azimuth Pitch:(CGFloat) pitch Roll:(CGFloat) roll;

#pragma mark Screenshot
- (void) onScreenshotDone:(NSString*)path;

@end

#pragma mark -

@protocol PGLibraryDelegate <NSObject>

@optional
-(NSString*)apiKey;			//	PROGOROD Maps API key. Should be 32-symbols length.
-(NSUInteger)subProvider;	//	should be in [10000, 2^31) range

#pragma mark Analythics
-(void)onAnalythicsEventCategory:(NSString*)category Action:(NSString*)action Label:(NSString*)label Value:(long long)value;

@end
