//
//  PGVoiceManager.h
//  ProGorodLight
//

#import <Foundation/Foundation.h>

typedef enum
{
	VoiceMute = -1,
	VoiceRusMan   = 0x0000,
	VoiceRusWoman = 0x0001,
	VoiceEngMan   = 0x0002,
	VoiceEngWoman = 0x0003,
	VoiceSpaMan   = 0x0004,
	//VoiceSpaWoman = 0x0005,
	//VoiceAzMan = 0x0006,
	//VoiceAzWoman = 0x0007,
	VoicesCount

}VoiceKind;

@interface PGVoiceManager : NSObject

+(NSArray*)availableVoices;	//	VoiceKind
+(NSString*)voiceTitle:(VoiceKind) voiceKind;

+(VoiceKind)currentVoice;
+(void)setCurrentVoice:(VoiceKind)voice;

+(int)maximumVolume;
+(int)currentVolume;
+(void)setCurrentVolume:(int)value;
+(void)playDemo;

@end

@protocol PGSoundsDownloaderDelegate <NSObject>

-(void)loadDidFinish;
-(void)loadDidFailed;
-(void)loadProgress:(NSInteger)loaded total:(NSInteger)total;

@end

#pragma mark -

@interface PGSoundsDownloader : NSObject

-(BOOL)start;
-(void)cancel;

@property(weak) id<PGSoundsDownloaderDelegate> delegate;

@property int downloaded;
@property int fileSize;

@end
