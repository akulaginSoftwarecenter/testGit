//
//  MapManager.h
//  ProGorodLight
//
//  Created by MacBook on 14.11.12.
//
//
#if _TILES_LIBRARY_

#import <Foundation/Foundation.h>

@protocol MapManagerUpdateDelegate <NSObject>

@optional
- (void)mapManagerListUpdate:(id)sender;
- (void)mapManagerPackageUpdate:(id)sender;

@end

typedef enum {
	PackageStateNeedUpdate,
	PackageStateLocal,
	PackageStateRemote,
	PackageStateNone
}PackageStateType;

@interface MapPackageItem : NSObject

- (NSString *)getPackageName;
- (NSUInteger)getPackageSize;
- (PackageStateType)getPackageState;

@end

@interface MapManager : NSObject

@property(nonatomic, weak, setter = setDelegate:)id<MapManagerUpdateDelegate> delegate;
@property(nonatomic, strong, readonly) NSArray* items;

- (id)init;
- (void)reloadPackages:(BOOL)localOnly;
- (void)cancelReloadPackages;

- (void)downloadPackageWithIndex:(NSUInteger)index;
- (void)updatePackageWithIndex:(NSUInteger)index;
- (void)removePackageWithIndex:(NSUInteger)index;

- (NSInteger)getPackageLoadedSize;
- (void)cancelPackageOperation;

- (BOOL)isPackageFinished;
- (BOOL)isPackageCanceled;
@end

#endif