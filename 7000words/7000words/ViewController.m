//
//  ViewController.m
//  7000words
//
//  Created by qingliu on 11/30/17.
//  Copyright © 2017 qingliu. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface ViewController ()
@property (strong, nonatomic) IBOutlet WKWebView *loadWebView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Set WebView size
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGRect webviewSize = CGRectMake(0.0, 20.0, screenRect.size.width, screenRect.size.height);
    self.loadWebView = [[WKWebView alloc] initWithFrame:(webviewSize)];
    self.loadWebView.layer.borderColor = [UIColor redColor].CGColor;
    //Create URL
    NSString *urlPath = [[NSBundle mainBundle] pathForResource:@"7000words" ofType:@"html"];
    NSLog(@"%@", urlPath);
    //NSString *
    NSError *error;
    NSString *encodeURL = [[NSString alloc] initWithContentsOfFile:urlPath encoding:NSUTF8StringEncoding error:&error];
//    //NSURL *url = [NSURL fileURLWithPath:urlPath];
//    //Get
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
 //   [self.loadWebView loadRequest:request];
    [self.loadWebView loadHTMLString:encodeURL baseURL:nil];
    [self.view addSubview:self.loadWebView];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
