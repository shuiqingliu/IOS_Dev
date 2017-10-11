//
//  ViewController.m
//  CalcuDistance
//
//  Created by qingliu on 10/11/17.
//  Copyright © 2017 qingliu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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

- (void) setStartLocation:(UITextField *)startLocation{
    startLocation.layer.borderWidth = 1;
    startLocation.layer.cornerRadius = 5;
}

- (void) setDestinationA:(UITextField *)destinationA{
    destinationA.layer.borderWidth = 1;
    destinationA.layer.cornerRadius = 5;
}

- (void) setDestinationB:(UITextField *)destinationB{
    destinationB.layer.borderWidth = 1;
    destinationB.layer.cornerRadius = 5;
}

- (void) setDestinationC:(UITextField *)destinationC{
    destinationC.layer.borderWidth = 1;
    destinationC.layer.cornerRadius = 5;
}


- (IBAction)calculateButtonTap:(id)sender {

}


@end
