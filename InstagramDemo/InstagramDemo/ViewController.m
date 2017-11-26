//
//  ViewController.m
//  InstagramDemo
//
//  Created by qingliu on 11/24/17.
//  Copyright © 2017 qingliu. All rights reserved.
//

#import "ViewController.h"
#import <NXOAuth2.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *logoutBtn;
@property (weak, nonatomic) IBOutlet UIButton *refreshBtn;
@property (weak, nonatomic) IBOutlet UIImageView *displayImage;

@end

@implementation ViewController

- (IBAction)loginAction:(id)sender {
    [[NXOAuth2AccountStore sharedStore] requestAccessToAccountWithType:@"Instagram"];
}

- (IBAction)logoutAction:(id)sender {
}

- (IBAction)refreshAction:(id)sender {
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
