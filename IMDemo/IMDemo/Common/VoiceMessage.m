//
//  VoiceMessage.m
//  IMDemo
//
//  Created by qingliu on 11/28/17.
//  Copyright © 2017 qingliu. All rights reserved.
//

#import "VoiceMessage.h"
#import <AVFoundation/AVFoundation.h>

@interface VoiceMessage()

@property (nonatomic,strong) AVAudioRecorder *recorder;
@property (nonatomic,strong) NSString *soundPath;

@end

@implementation VoiceMessage

#pragma mark - Instance

+ (instancetype)shareInstance{
    static VoiceMessage *sharedInstance = nil;
    static dispatch_once_t dispatchOnce;
    dispatch_once(&dispatchOnce,^{
        if (sharedInstance == nil) {
            sharedInstance = [[VoiceMessage alloc] init];
        }
    });
    return sharedInstance;
}



#pragma mark - Getters

- (NSDictionary *)recordingSettings{
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

- (NSString*)soundFilePath{
    return self.soundPath;
}

#pragma mark - voice method
- (void)recordMessage:(NSString *)filePath{
    self.soundPath = filePath;
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
    //set file path and file name
    NSString *fileName = [NSString stringWithFormat:@"/voice-test.caf"];
    self.soundPath = [self.soundPath stringByAppendingPathComponent:fileName];
    NSURL *recordURL = [NSURL fileURLWithPath:self.soundPath];
    //initial AVAudioRecorder
    _recorder = [[AVAudioRecorder alloc] initWithURL:recordURL settings:[self recordingSettings] error:&error];
    [_recorder prepareToRecord];
    [self.recorder setMeteringEnabled:YES];
    [self.recorder record];
    
}

- (void)stopRecord:(UIView *)view{
    [self.recorder stop];
}

- (void)playMessage:(NSURL *)playURL{
    
}

@end
