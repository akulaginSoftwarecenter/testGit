//
//  PGRoute.h
//  ProGorodLight
//

#import <Foundation/Foundation.h>

#import "PGOverlay.h"

@protocol PGLiteRouteDelegate<NSObject>

-(void)routeBuilt:(BOOL)result;

@optional
-(void)guideUpdatedRoadName:(NSString*)roadName0 image0:(UIImage*)image0 distance0:(NSInteger)distance0 roadName1:(NSString*)roadName1 image1:(UIImage*)image1 distance1:(NSInteger)distance1;
-(void)carSpeedUpdated:(NSInteger)carSpeed;
-(void)safetyUpdatedImage:(UIImage*)image meters:(NSInteger)meters speedLimit:(NSInteger)speedLimit speedOver:(BOOL)speedOver;
-(void)guideUpdatedLane:(UIImage*)laneImage;
@end

#pragma mark -

@interface PGRoutePoint : NSObject

-(id)initWithPos:(PGGeoPoint)pos title:(NSString*)title;
-(id)initWithCarPos;

@property BOOL isCarPos;    // if set, pos is ignored
@property PGGeoPoint pos;
@property(copy) NSString* title;

@end

#pragma mark -

@interface PGLiteRoute : NSObject


typedef enum {eSpeedLimit, eSpeedCam} ESpeedCamIconStyle;
typedef enum
{
	eROUTE_ERR_UNKNOWN = -1,
	eROUTE_ERR_NONE = 0,
	eROUTE_ERR_ALREAY_RUNNING,
	eROUTE_ERR_DONT_SET_DEST,
	eROUTE_ERR_DONT_SET_START,
	eROUTE_ERR_NEAR_POS_DEST,
	eROUTE_ERR_NEAR_POS_VIA,
	eROUTE_ERR_NEAR_POS_START,
	eROUTE_ERR_INVALID_POS_START,
	eROUTE_ERR_INVALID_POS_VIA,
	eROUTE_ERR_INVALID_POS_DEST,

	eROUTE_ERR_CLOSED_START,
	eROUTE_ERR_CLOSED_VIA,
	eROUTE_ERR_CLOSED_DEST,
	eROUTE_ERR_NOTCONNECTED_PATH,
	eROUTE_ERR_FAIL_ROUTE,

	// For web routing only:
	eROUTE_ERR_INCOMPATIBLE_MAPS,
	// PROGOROD tries to re-route after the errors below:
	eROUTE_ERR_CANT_CONNECT,
	eROUTE_ERR_CANT_SEND_REQUEST,
	eROUTE_ERR_CANT_DOWNLOAD,
	eROUTE_ERR_CORRUPTED_DATA,
	eROUTE_ERR_INCOMPATIBLE_SERVER,

	eROUTE_ERR_LAST,
} ERouteErrorCode;

-(void)clearRouteResults: (BOOL)keepBasePoints;

-(void)setStartPos:(PGRoutePoint*)pos;
-(void)setFinishPos:(PGRoutePoint*)pos;

-(void)setViaPos:(NSArray*)points;	//	PGRoutePoint

-(void)setUseTraffic:(BOOL)useTraffic;

-(BOOL)buildRoute;

-(void)startGuide;
-(void)endGuide;

-(void)routeOverview;

-(BOOL)isGuide;
-(double)leftDistance;
-(NSTimeInterval)leftTime;

-(void)startGuideDemo;
-(void)endGuideDemo;

-(void)setSpeedCamIconStyle:(ESpeedCamIconStyle)style;
-(ERouteErrorCode)getError;

@property(weak) id<PGLiteRouteDelegate> delegate;

@end

//typedef struct
//{
//    int safetyType;
//    int safetyIdx;
//    int safetySpeed;
//    int safetyDist;
//} NOROUTE_SAFETY_INFO;

@interface PGRoadInformation : NSObject

//-(void)getRoadName:(NSString**)roadName speedLimit:(int*)speedLimit forLocation:(PGGeoPoint)geoPoint vehicleAngle:(double)vehicleAngle safetyInfo:(NOROUTE_SAFETY_INFO*) noRouteSafetyInfo;

@end

#pragma mark -

