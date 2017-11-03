//
//  ViewController.m
//  MusicPlayer
//
//  Created by qingliu on 11/2/17.
//  Copyright © 2017 qingliu. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController () <AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UIButton *pauseBtn;
@property (weak, nonatomic) IBOutlet UIButton *muteBtn;
@property (weak, nonatomic) IBOutlet UILabel *currentTime;
@property (weak, nonatomic) IBOutlet UILabel *playDuration;
@property (weak, nonatomic) IBOutlet UISlider *musicProgress;

@property  AVAudioPlayer *player;
@property NSTimer *timer;

@end

@implementation ViewController

- (IBAction)playMusic:(id)sender {
    [self.player  play];
    //if timer not valid then restart it
    if(![self.timer isValid]){
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self
                                                    selector:@selector(updateTime)
                                                    userInfo:nil repeats:YES];
    }
}

- (IBAction)pauseMusic:(id)sender {
    //if not playing then start play
    if(![self.player isPlaying]){
        [self.player play];
    }else{
        [self.player pause];
    }
    
}

- (IBAction)muteMusic:(id)sender {
    //stop play
    [self.player stop];
    self.currentTime.text = @"0.00";
    //set current progress to zero;
    self.player.currentTime = 0;
    self.musicProgress.value = 0;
    //stop timer
    [self.timer invalidate];
}
- (IBAction)volumeControl:(id)sender {
    self.player.currentTime = self.musicProgress.value * self.player.duration;
}

//create music player
- (void) createPlayer{
    //get music source
    NSString *file = [[NSBundle mainBundle] pathForResource:@"now" ofType:@"mp3"];
    //convert string to URL
    NSURL *urlOfMusic = [NSURL URLWithString:file];
    
    //init audio player
    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:urlOfMusic error:nil];
    //prepare and decode
    [self.player prepareToPlay];
    //set player paraments
    self.player.numberOfLoops = 1;
    self.player.volume = 0.5;
    
    //update progress with timer
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    //set play status
    self.playDuration.text = [NSString stringWithFormat:@"%0.2f",self.player.duration/60];
    
    self.player.delegate = self;
}

- (void)updateTime{
    self.musicProgress.value = self.player.currentTime/self.player.duration;
    self.currentTime.text = [NSString stringWithFormat:@"%.2f",self.player.currentTime/60];
}

- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    [self.timer invalidate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createPlayer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
