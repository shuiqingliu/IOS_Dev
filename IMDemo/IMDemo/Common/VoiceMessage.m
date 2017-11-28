//
//  VoiceMessage.m
//  IMDemo
//
//  Created by qingliu on 11/28/17.
//  Copyright © 2017 qingliu. All rights reserved.
//

#import "VoiceMessage.h"
#import <AVFoundation/AVFoundation.h>

@implementation VoiceMessage

- (void)recordMessage:(AVAudioRecorder *)recorder recordURL:(NSURL *)recordURL{
    //Create AVAudioSession object
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    NSError *error = nil;
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord
                  withOptions:AVAudioSessionCategoryOptionDefaultToSpeaker
                        error:&error];
    if (error) {
        return;
    }else{
        [audioSession setActive:YES error:&error];
        if (error) {
            return;
        }
    }
    
    recorder = [AVAudioRecorder alloc] initWithURL:<#(nonnull NSURL *)#> settings:<#(nonnull NSDictionary<NSString *,id> *)#> error:<#(NSError * _Nullable __autoreleasing * _Nullable)#>
    
    //set record source

}
@end
