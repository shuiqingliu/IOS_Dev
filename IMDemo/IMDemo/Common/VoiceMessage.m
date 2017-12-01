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



#pragma mark - Getters

- (NSDictionary *)recordingSettings
{
    NSMutableDictionary *recordSetting =[NSMutableDictionary dictionaryWithCapacity:10];
    [recordSetting setObject:[NSNumber numberWithInt: kAudioFormatLinearPCM] forKey: AVFormatIDKey];
    //2 采样率
    [recordSetting setObject:[NSNumber numberWithFloat:8000.0] forKey: AVSampleRateKey];
    //3 通道的数目
    [recordSetting setObject:[NSNumber numberWithInt:1]forKey:AVNumberOfChannelsKey];
    //4 采样位数  默认 16
    [recordSetting setObject:[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
    return recordSetting;
}


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
    
    //initial AVAudioRecorder
    recorder = [[AVAudioRecorder alloc] initWithURL:recordURL settings:[self recordingSettings] error:&error];
    
    //set record source

}

- (void)playMessage:(NSURL *)playURL{
    
}

@end
