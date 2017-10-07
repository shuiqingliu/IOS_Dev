//
//  ViewController.m
//  HelloWorld
//
//  Created by qingliu on 9/26/17.
//  Copyright © 2017 qingliu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testButton:(id)sender {
    int height_feet = 5;
    int height_inches = 11;
    double height_cm = ((height_feet * 12.0) + height_inches) * 2.54; // 1inch = 2.54 cm
    self.testLabel.text = [NSString stringWithFormat:@"%f",height_cm];
}

@end
