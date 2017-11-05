//
//  ViewController.m
//  VideoPlay
//
//  Created by qingliu on 11/5/17.
//  Copyright © 2017 qingliu. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface ViewController ()

@property (strong,nonatomic) AVPlayerViewController* videoPlayer;
@property (strong,nonatomic) AVPlayer *player;
@property (strong,nonatomic) AVPlayerItem *playItem;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //setting video path
    NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"cartoon" ofType:@"mp4"];
    
    NSLog(@"路径是：%@",videoPath);
    
    NSURL *videoURL = [NSURL fileURLWithPath:videoPath];
    
    //AVAsset *assert = [AVAsset assetWithURL:videoURL];
    self.playItem = [AVPlayerItem playerItemWithURL:videoURL];
    //set player's item
    self.player = [AVPlayer playerWithPlayerItem:self.playItem];
    //init player view controller
    self.videoPlayer = [[AVPlayerViewController alloc] init];
    self.videoPlayer.player = self.player;
    //add to superview
    [self.view addSubview:self.videoPlayer.view];
    
    //set player frame
    self.videoPlayer.view.frame = self.view.frame;
    
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NSString* videoStr = @"http://mov.bn.netease.com/open-movie/nos/flv/2014/05/28/S9SDUHLHU_sd.flv";
//
//    NSURL *videoURL = [NSURL URLWithString:videoStr];
//
//    self.playView = [[ MPMoviePlayerViewController alloc] initWithContentURL:videoURL];
//    self.playView.view.frame = self.view.bounds;
//
//    [self.view addSubview:self.playView.view];
//
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
