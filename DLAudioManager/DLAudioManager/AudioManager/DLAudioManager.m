//
//  AudioManager.m
//  跆拳道助手
//
//  Created by macbook on 16/1/20.
//  Copyright © 2016年 qinzhen. All rights reserved.
//

#import "DLAudioManager.h"
#import <AVFoundation/AVFoundation.h>

@interface DLAudioManager ()<AVAudioPlayerDelegate>{
    AVAudioPlayer * _audioPlayer;
}
@end

@implementation DLAudioManager

+(id)sharedManager{
    static DLAudioManager * manager = nil;
    @synchronized(self) {
        if (manager == nil) {
            manager = [[DLAudioManager alloc]init];
        }
    }
    return manager;
}


- (void)playSoundEffect:(NSString *)name{
    NSString * audioFile = [[NSBundle mainBundle]pathForResource:name ofType:nil];
    NSString* changeUrl = [audioFile stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *fileUrl = [NSURL URLWithString:changeUrl];
    
    NSLog(@"%@",audioFile);
    NSLog(@"%@",fileUrl);
    NSError * error = nil;
    _audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:fileUrl error:&error];
    if (_audioPlayer!=nil) {
        [_audioPlayer prepareToPlay];
        [_audioPlayer play];
    }
    else
        NSLog(@"%@",error.localizedDescription);
    
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    if (self.blockOnFinish) {
        self.blockOnFinish();
    }
}

-(void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error{
    NSLog(@"error:%@",error.localizedDescription);
}

@end
