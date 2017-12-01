//
//  ViewController.m
//  IMDemo
//
//  Created by qingliu on 11/27/17.
//  Copyright © 2017 qingliu. All rights reserved.
//

#import "ViewController.h"
#import "VoiceMessage.h"

#define DocumentPath  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

NSString *const kXMNAudioDataKey;

@interface ViewController ()<AVAudioPlayerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *recordBtn;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic, strong) NSString *filePath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_recordBtn addTarget:self action:@selector(recordAction) forControlEvents:UIControlEventTouchDown];
    [_recordBtn addTarget:self action:@selector(stopRecord) forControlEvents:UIControlEventTouchUpInside];
   // [_playBtn addTarget:self action:@selector(playVoice) forControlEvents:UIControlEventAllTouchEvents];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)playAction:(id)sender {
    [self playVoice];
}

- (void)recordAction{
    __block BOOL isAllowRec = 0;
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    if ([audioSession respondsToSelector:@selector(requestRecordPermission:)]) {
        [audioSession performSelector:@selector(requestRecordPermission:) withObject:^(BOOL granted){
            if (granted) {
                isAllowRec = 1;
            }else{
                isAllowRec = 0;
            }
        }];
        if (isAllowRec) {
            NSLog(@"staring record");
            NSLog(@"%@",[self recordPath]);
            self.filePath = [self recordPath];
            [[VoiceMessage shareInstance] recordMessage:[self recordPath]];
        }
    }
}

- (void)stopRecord{
    [[VoiceMessage shareInstance] stopRecord:self.view];
    NSLog(@"RecordStoped!");
}

- (void)playVoice{
    NSLog(@"starting play");
    NSString *filePath = [DocumentPath stringByAppendingPathComponent:@"SoundFile/voice-test.caf"];
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error: nil];
    NSData *audioData = [NSData dataWithContentsOfFile:filePath];
    NSError *audioPlayerError;
    _audioPlayer = [[AVAudioPlayer alloc] initWithData:audioData error:&audioPlayerError];
    _audioPlayer.delegate = self;
    [_audioPlayer prepareToPlay];
    [_audioPlayer play];
    
}


- (NSString *)recordPath {
    NSString *filePath = [DocumentPath stringByAppendingPathComponent:@"SoundFile"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSError *error = nil;
        [[NSFileManager defaultManager] createDirectoryAtPath:filePath withIntermediateDirectories:NO attributes:nil error:&error];
        if (error) {
            NSLog(@"%@", error);
        }
    }
    return filePath;
}



@end
