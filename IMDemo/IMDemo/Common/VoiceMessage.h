//
//  VoiceMessage.h
//  IMDemo
//
//  Created by qingliu on 11/28/17.
//  Copyright © 2017 qingliu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

@interface VoiceMessage : NSObject

@property (nonatomic,copy) NSString *soundFilePath;
@property (nonatomic,copy) NSURL *recordURL;

+ (instancetype)shareInstance;

- (void)recordMessage:(NSString *)recordURL;
- (void)playMessage:(NSURL *)playURL;
- (void)stopRecord:(UIView *)view;

@end
