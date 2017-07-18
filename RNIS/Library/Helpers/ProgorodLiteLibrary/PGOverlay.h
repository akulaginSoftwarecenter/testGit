//
//  PGOverlay.h
//  ProGorodLight
//
//  Created  on 14.05.12.
//  Copyright (c) 2012 CDCOM. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct {
    double latitude;
    double longitude;
} PGGeoPoint;

#pragma mark -

@interface PGOverlayItem : NSObject
@property PGGeoPoint geoPoint;
-(id)initWithGeoPoint:(PGGeoPoint) geoPoint;
@end

#pragma mark -

@interface PGOverlay : NSObject
{
	@package
	int mId;
}
- (NSMutableArray*) items;
- (void) populate;
- (void) setBitmap:(UIImage*)image xOffset:(float)xOffset yOffset:(float)yOffset;
		//	xOffset: 0 - center, -1 - shift bitmap to left, 1 - shift bitmap to right
		//	yOffset: 0 - center, -1 - shift bitmap to top, 1 - shift bitmap to bottom
- (void) setBitmap:(UIImage*)image xOffset:(float)xOffset yOffset:(float)yOffset isPlain:(BOOL)isPlain sizeInMeters:(int)meters;
//	xOffset: 0 - center, -1 - shift bitmap to left, 1 - shift bitmap to right
//	yOffset: 0 - center, -1 - shift bitmap to top, 1 - shift bitmap to bottom
//	isPlain: NO - always in screen plain, YES - is in the map plain
@end

#pragma mark -

@interface PGMyLocationOverlay : PGOverlay
-(void)setRotationEnabled:(BOOL)enabled;
@end

#pragma mark -

typedef enum {
    PG_SPECIAL_OVERLAY_START_ROUTE = -1,
    PG_SPECIAL_OVERLAY_FINISH_ROUTE = -2
} PGSpecialOverlayType;

@interface PGSpecialOverlay : PGOverlay

-(id)initWithType:(PGSpecialOverlayType)type;

@end

#pragma mark -

@interface PGPolyline : NSObject
-(id) init;
-(void)addPoints:(const PGGeoPoint*)points count:(int)count color:(UIColor*)color;
-(void)setLastAddedNodeBitmap:(UIImage*)image;
-(void)clear;
-(void)setOutlineColor:(UIColor*)color;
-(void)setLineWidth:(CGFloat)width;
-(void)setStartStopWidth:(CGFloat)width;
-(void)setNodesWidth:(CGFloat)width;
-(void)setBorderWidth:(CGFloat)width;
-(void)setHighlightedPointIndex:(int)index offset:(CGFloat)offset;    //  -1 - no highlight
-(void)setHighlightedNodeColor:(UIColor*)color;
@end

#pragma mark -

@interface PGPolygon : NSObject
-(id)init;
-(void)clear;
-(void)setColor:(UIColor*)color;
-(void)setPoints:(const PGGeoPoint*)points pointsCount:(int)pointsCount contourVertCount:(const int*)contourVertCount contourCount:(int)contourCount;
@end


#pragma mark

@protocol PGArrowsDelegate <NSObject>

-(void)arrowSelected:(int)arrowId;

@end

@interface PGArrows : NSObject

@property (weak) id<PGArrowsDelegate> delegate;

-(void)setBodyImage:(NSString*)image width:(CGFloat)width height:(CGFloat)height;
-(void)setPositionX:(CGFloat)x y:(CGFloat)y;
-(void)addArrowId:(int)arrowId angle:(CGFloat)angle image:(NSString*)image;
-(void)setArrowLength:(CGFloat)length;
-(void)setArrowWidth:(CGFloat)width;
-(void)unset;

@end
