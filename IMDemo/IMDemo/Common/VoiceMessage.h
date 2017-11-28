//
//  VoiceMessage.h
//  IMDemo
//
//  Created by qingliu on 11/28/17.
//  Copyright © 2017 qingliu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface VoiceMessage : NSObject

@property (nonatomic,weak) AVAudioRecorder *recorder;
@property (nonatomic,copy) NSString *fileName;
@property (nonatomic,copy) NSURL *recordURL;

- (void)recordMessage:(AVAudioRecorder *)recorder recordURL:(NSURL *)recordURL;
- (void)playMessage:(NSURL *)playURL;
@end
