//
//  AudioManager.h
//  跆拳道助手
//
//  Created by macbook on 16/1/20.
//  Copyright © 2016年 qinzhen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^BlockOnFinishAudio)(void);

@interface DLAudioManager : NSObject

@property (nonatomic,copy)BlockOnFinishAudio blockOnFinish;

+ (id)sharedManager;
- (void)playSoundEffect:(NSString *)name;

@end
