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

@interface ViewController () <CRCurrencyRequestDelegate>
@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *currencyEUR;
@property (weak, nonatomic) IBOutlet UILabel *currencyJPY;
@property (weak, nonatomic) IBOutlet UILabel *currencyGBP;

@end

@implementation ViewController
- (IBAction)tapButton:(id)sender {
    self.convertButton.enabled = NO;
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies{
    
    double inputValue = [self.inputField.text floatValue];
    //get exchange rate and calculate money
    double eurCurrency = inputValue * currencies.EUR;
    double jpyCurrency = inputValue * currencies.JPY;
    double gbpCurrency = inputValue * currencies.GBP;
    
    //create new NSString Object
    NSString *eurValue = [NSString stringWithFormat:@"%.2f",eurCurrency];
    NSString *jpyValue = [NSString stringWithFormat:@"%.2f",jpyCurrency];
    NSString *gbpValue = [NSString stringWithFormat:@"%.2f",gbpCurrency];
    
    //set value to relevant field
    self.currencyEUR.text = eurValue;
    self.currencyJPY.text = jpyValue;
    self.currencyGBP.text = gbpValue;
    
    //recovery button status
    self.convertButton.enabled = YES;
}

@end
