//
//  MapView.h
//  ProGorod
//
//  Created by Irina on 1/14/11.
//  Copyright 2011 ProGorod. All rights reserved.
//
#ifndef __MapView_h__ 
#define __MapView_h__ 

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <AVFoundation/AVFoundation.h>

#if !defined (_LIBRARY_APP_)
#	import "EzConfig.h"
#endif

/********************** Text input handler *************************************************/
#if USE_NATIVE_SCREEN_KEYBOARD
#	import "BasicTextInput.h"
#endif // USE_NATIVE_SCREEN_KEYBOARD

/********************** Base class for PROGOROD UIView instance ****************************/
#if USE_NATIVE_SCREEN_KEYBOARD
@interface PGView: TextInputHandler {
#else
@interface PGView: UIView {
#endif
@protected
	bool    m_bOnForeground;
}
- (void) enterForeground;
- (void) enterBackground;
@end

/********************** OpenGL engine class over an UIView *********************************/
#if _USE_OPENGL_
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/EAGLDrawable.h>

@interface OpenGLEngine: NSObject {
@private
	EAGLContext *context;
	GLuint viewRenderbuffer, viewFramebuffer, depthRenderbuffer;
	GLint backingWidth, backingHeight;
	CAEAGLLayer *m_eaglLayer;
@public
	bool m_bOnForeground;
#if _TILES_LIBRARY_
	BOOL m_bApplicationOnForeground;
#endif
}

- (id)initWithView: (UIView *)view;
- (void)drawView:(NSObject*)obj;
- (BOOL)createFramebuffer;
- (void)destroyFramebuffer;
@end

/********************** Base class of UIView instance with OpenGL renderer *****************/
@interface OpenGLView: PGView {
@protected
	OpenGLEngine *m_OpenGL;
}
@end
#endif // _USE_OPENGL_

/********************** The main PROGOROD window class *************************************/
#if _TILES_LIBRARY_
#include "PGOverlay.h"
extern NSString* const MapEventNotification;
extern NSString* const MapTouchEventNotification;
extern NSString* const MapLongTouchEventNotification;
extern NSString* const LocationChangedEventNotification;
extern NSString* const OverlayEventNotification;
extern NSString* const ScreenshotEventNotification;
extern NSString* const TrafficInfoChangedEventNotification;
@class PGMyLocationOverlay;
@protocol PGLibraryDelegate, PGMapViewDelegate;
#endif

extern NSString* const ProgorodThreadExitNotification;

#if _USE_OPENGL_ && !_OPENGL_MAP_ONLY_
@interface MapView : OpenGLView
#else
@interface MapView : PGView
#endif
							< CLLocationManagerDelegate
							, UIAccelerometerDelegate
							, UIWebViewDelegate
							, UITextViewDelegate
#if !TARGET_IPHONE_SIMULATOR
							, AVCaptureVideoDataOutputSampleBufferDelegate
#endif
							>
{
@private
	CGFloat m_scale;
	CGFloat m_ZoomDistance;
	CGFloat m_LastZoomDistance;
	CGPoint m_ZoomMiddle;
	bool    m_bAppRunning;
	
	NSMutableData* m_ResponseText;
#if _TILES_LIBRARY_
	CLLocationManager *gps;	
	PGMyLocationOverlay* mMyLocationOverlay;
	NSMutableArray* mOverlays;
#endif
@public
	int m_EditTextMaxLength;
}

- (void)setImageFrame: (CGRect)frame orientation:(UIDeviceOrientation)orientation;
- (void)onMessageBoxQuit:(int) result;
- (void)imageSelectResult: (UIImage*) image;
- (void)saveConfigs;
- (void)enterBackground;
- (void)enterForeground;
#if _TILES_LIBRARY_
- (void)enterApplicationBackground;
- (void)enterApplicationForeground;
#endif

- (void)startApplication;
#if PUSH_NOTIFICATIONS
- (void)sendToken: (char const * )token :(int)length;
#endif

#if _TILES_LIBRARY_
+(void)setLibraryDelegate:(id<PGLibraryDelegate>)delegate;	//	should be called before creating MapView

@property(weak) id<PGMapViewDelegate> delegate;

@property(readonly) PGGeoPoint lastCenterCoord;
@property(readonly) PGGeoPoint lastMinCoord;
@property(readonly) PGGeoPoint lastMaxCoord;
@property(readonly) int lastZoom;
@property(readonly) int lastTrafficMark;

-(NSString*) getProgorodDeviceID;
-(BOOL) enableCompass;		//	Enable updates from compass sensor
-(BOOL) enableMyLocation;	//	Starts location updates
-(void) disableCompass;		//	Disable updates from compass sensor
-(void) disableMyLocation;	//	Stops location updates
- (int) getMapRegime;
- (int) getMaxZoomLevel;
- (int) getMinZoomLevel;
- (int) getMyLocationState;
- (BOOL) getTraffic;
- (int) getZoomLevel;
- (void) makeScreenshot;	// result will be in PGMapViewDelegate onScreenshotDone
- (PGMyLocationOverlay*) myLocationOverlay;
- (NSMutableArray*) overlays;
- (void) setFrame: (CGRect)frame;
- (void) setAllowRotation:(BOOL)allowRotation;
- (void) setMapRegime:(int)regime;
- (void) setMapCenter:(PGGeoPoint) center;
- (void) setMockLocation:(PGGeoPoint) location;	//	Sets my location cursor to the fake place
- (void) setMyLocationEnabled:(BOOL)enabled;
- (void) setTraffic:(BOOL)traffic;
- (void) setZoomLevel:(int)zoomLevel;
- (void) setMaxZoomLevel:(int)zoomLevel;
- (BOOL) zoomIn;
- (BOOL) zoomOut;
- (BOOL) getBuilding3D;
- (void) setBuilding3D:(BOOL)enabled;
- (BOOL) isSendingTracksEnabled;
- (void) setSendingTracksEnabled:(BOOL)enabled;
- (void) clearMapCache;
- (int64_t) getMapCacheSize;
- (int)  getFontSizeIndex;
- (void) setFontSizeIndex:(int)index;

typedef enum {
    dayNightModeAuto,
    dayNightModeDay,
    dayNightModeNight,
    dayNightModeUser
} dayNightMode;
    
#define CURRENTMODE_KEY @"currentModeKey"
#define NIGHTTIME_KEY @"nightTimeKey"
    
- (void) setDayStyleMode:(dayNightMode)mode userModeNightTime:(NSArray *)nightTime;
- (NSDictionary *) getDayStyleMode;

- (void)setPackagesHost:(NSString *)host;
//- (void)setTilesHost:(NSString *)host;
//- (void)setTrafficTilesHost:(NSString *)host;
- (void)setTrafficMarksHost:(NSString *)host;

- (void)setTilesSourceScheme:(int)scheme params:(NSArray*)params;
- (BOOL) setMapHost:(NSString *)host;

-(double)projXfromLng:(double)longitude zoom:(int)zoom;
-(double)projYfromLat:(double)latitude zoom:(int)zoom;

- (void)setLanguage:(NSString*)language;	//	ru, en
#endif

@end // MapView

#endif /* __MapView_h__ */
