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

@end

@implementation ViewController

- (IBAction)playMusic:(id)sender {
}

- (IBAction)pauseMusic:(id)sender {
}

- (IBAction)muteMusic:(id)sender {
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
