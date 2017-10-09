//
//  ViewController.m
//  CurrencyConversion
//
//  Created by qingliu on 10/8/17.
//  Copyright © 2017 qingliu. All rights reserved.
//

#import "ViewController.h"
#import <CurrencyRequest/CRCurrencyRequest.h>
#import <CurrencyRequest/CRCurrencyResults.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *currencyEUR;
@property (weak, nonatomic) IBOutlet UILabel *currencyJPY;
@property (weak, nonatomic) IBOutlet UILabel *currencyGBP;

@end

@implementation ViewController
- (IBAction)tapButton:(id)sender {
    self.convertButton.enabled = NO;
    
    self.convertButton.enabled = YES;
}

@end
