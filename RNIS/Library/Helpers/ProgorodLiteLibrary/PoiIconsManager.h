//
//  PoiIconsManager.h
//  ProGorodLight
//
//
//

#import <Foundation/Foundation.h>

#import "PGMapViewDelegate.h"

@interface POI : NSObject

@property(strong) NSString* name;
@property BOOL show;

@end

#pragma mark -

@interface AClassPOI : POI

@property int a_cc;
@property BOOL isMegafonPOI;
@property BOOL isGeoblog;
@property BOOL isUniversiade;

@end

#pragma mark -

@interface BClassPOI : POI

@property int b_cc;
@property(strong) NSString* geoblog_type;
@property BOOL is_readonly;

-(int)a_cc;

@end

#pragma mark -

@interface PGPoiIconsManager : NSObject

-(void)checkPoiLists;
-(BOOL)isLoaded;

-(UIImage*)iconForMenuACat:(int)a_cc;
-(UIImage*)iconForMenuBCat:(int)b_cc;

-(void)setAPoi:(int)a_cc show:(BOOL)show;
-(void)clearApoisShow;

-(NSArray*)bPoisForA:(int)a_cat;	//	BClassPOI
-(void)setBPoi:(BClassPOI*)bpoi;

+(void)showPoiLayerOnMap:(BOOL)show categoryA:(int)filterCategoryA categoryB:(int)filterCategoryB;

+(int)hardcoded_geoblog_a_cc;

@property(strong) NSArray* apois;	//	AClassPOI
@property(strong) NSArray* bpois;	//	BClassPOI

@end

#pragma mark -

@interface PGGeoblogManager : NSObject

+(NSData*)requestBodyFor_ApproveDecline:(BOOL)approve forEvent:(int)eventid;

+(NSData*)requestBodyFor_CreateComment:(NSString*)comment forEvent:(int)eventid;
+(NSData*)requestBodyFor_EditComment:(NSString*)comment forCommentEvent:(int)comment_eventid;

+(NSData*)requestBodyFor_CreateGeoblogWithLocation:(PGGeoPoint)location type:(NSString*)type description:(NSString*)description line:(NSString*)line;
+(NSData*)requestBodyFor_DeleteEvent:(int)eventid;

+(NSData*)requestBodyFor_getSemanticById:(int)eventid;

@end

#define NotificationPoiListLoaded @"NotificationPoiListLoaded"
