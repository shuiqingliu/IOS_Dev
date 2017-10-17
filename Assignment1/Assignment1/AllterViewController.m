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
    //get screen width and height
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    NSLog(@"screenWidth:%0.2f,screenHeight:%0.2f",screenWidth,screenHeight);
    self.view.backgroundColor = [UIColor clearColor];
    //creat a instance of UIView
    UIView *alterView = [[UIView alloc]init];
    //set UIView position and size
    alterView.frame = CGRectMake(15, screenHeight - 175, screenWidth - 30, 160);
    NSLog(@"x:%d,y:%f,width:%f,height:%d",15,screenHeight -175,screenWidth - 30,160);
    //set UIView background color and corner radius
    alterView.backgroundColor = [UIColor whiteColor];
    alterView.layer.cornerRadius = 5;
    //add view to superview which is its new superview
    [self.view addSubview:alterView];
    // add gesture recongnizer to current superview
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissVC:)];
    [self.view addGestureRecognizer:tap];
    
}

-(void) dismissVC:(id) sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//- (void)loadView{
//    NSLog(@"第二个 storyboard 加载 view");
//}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"第二个控制器的 view 将要显示");
}

- (void)viewWillLayoutSubviews{
    NSLog(@"第二个控制器的 view 将要布局子控件");
}

- (void)viewDidLayoutSubviews{
    NSLog(@"第二个控制器的 view 布局子控件完成");
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"第二个控制器的 view 显示完毕");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"第二个控制器的 view 即将消失");
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"第二个控制器的 view 完全消失");
}


@end
