//
//  ViewController.m
//  CalcuDistance
//
//  Created by qingliu on 10/11/17.
//  Copyright © 2017 qingliu. All rights reserved.
//

#import "ViewController.h"
#import <DistanceGetter/DGDistanceRequest.h>

@interface ViewController ()

@property (nonatomic) DGDistanceRequest *requst;

@property (weak, nonatomic) IBOutlet UITextField *startLocation;

@property (weak, nonatomic) IBOutlet UITextField *destinationA;
@property (weak, nonatomic) IBOutlet UILabel *distanceA;

@property (weak, nonatomic) IBOutlet UITextField *destinationB;
@property (weak, nonatomic) IBOutlet UILabel *distanceB;

@property (weak, nonatomic) IBOutlet UITextField *destinationC;
@property (weak, nonatomic) IBOutlet UILabel *distanceC;

@property (weak, nonatomic) IBOutlet UIButton *calculateButton;

@end

@implementation ViewController
//button action define
- (IBAction)calculateButtonTap:(id)sender {
    
    self.calculateButton.enabled = NO;
    //init DGDistanceRequest object
    self.requst = [DGDistanceRequest alloc];
    //get string from textfield
    NSString *start = self.startLocation.text;
    NSString *destA = self.destinationA.text;
    NSString *destB = self.destinationB.text;
    NSString *destC = self.destinationC.text;
    NSArray *dest = @[destA,destB,destC];

    self.requst = [self.requst initWithLocationDescriptions:dest sourceDescription:start];
    //weak reference
    __weak ViewController *weakSelf = self;
    //invoke callback
    self.requst.callback = ^(NSArray *distances) {
        ViewController *strongSelf = weakSelf;
        if(!strongSelf) return ;
        
        NSNull *badResult = [NSNull null];
        //distance A calculate
        if(distances[0] != badResult){
            double num = ([distances[0] floatValue]/1000.0);
            NSString *x = [NSString stringWithFormat:@"%.2f km",num];
            strongSelf.distanceA.text = x;
        }
        else{
            strongSelf.distanceA.text = @"Error";
        }
        //distance B calculate
        if(distances[1] != badResult){
            double num = ([distances[1] floatValue]/1000.0);
            NSString *x = [NSString stringWithFormat:@"%.2f km",num];
            strongSelf.distanceB.text = x;
        }
        else{
            strongSelf.distanceB.text = @"Error";
        }
        //distance C calculate
        if(distances[2] != badResult){
            double num = ([distances[2] floatValue]/1000.0);
            NSString *x = [NSString stringWithFormat:@"%.2f km",num];
            strongSelf.distanceC.text = x;
        }
        else{
            strongSelf.distanceC.text = @"Error";
        }
        
        strongSelf.requst = nil;
        strongSelf.calculateButton.enabled = YES;
    };
    
    [self.requst start];
}

- (void)viewDidLoad{
    //set textfield property
    self.startLocation.layer.borderWidth = 1;
    self.startLocation.layer.cornerRadius = 5;

    self.destinationA.layer.borderWidth = 1;
    self.destinationA.layer.cornerRadius = 5;

    self.destinationB.layer.borderWidth = 1;
    self.destinationB.layer.cornerRadius = 5;

    self.destinationC.layer.borderWidth = 1;
    self.destinationC.layer.cornerRadius = 5;
}

@end
