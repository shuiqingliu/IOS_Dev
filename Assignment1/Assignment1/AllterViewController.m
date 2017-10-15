//
//  AllterViewController.m
//  Assignment1
//
//  Created by qingliu on 10/15/17.
//  Copyright © 2017 qingliu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlterViewController.h"

@interface AlterViewController()

@end

@implementation AlterViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    self.view.backgroundColor = [UIColor clearColor];
    UIView *alterView = [UIView new];
    alterView.frame = CGRectMake(15, [UIScreen mainScreen].bounds.size.height - 175, screenWidth - 30, 160);
    alterView.backgroundColor = [UIColor whiteColor];
    alterView.layer.cornerRadius = 5;
    [self.view addSubview:alterView];
}

- (void)backAction{
    [self dismissViewControllerAnimated:YES  completion:nil];
}

@end
