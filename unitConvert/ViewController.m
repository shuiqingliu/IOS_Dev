//
//  ViewController.m
//  unitConvert
//
//  Created by qingliu on 10/5/17.
//  Copyright © 2017 qingliu. All rights reserved.
//

#import "ViewController.h"

double convertOneToTwo(double oneToTwo){
    double unitOneTounitTwo = 10* oneToTwo + 2;
    return unitOneTounitTwo;
}

double convertOneToThree(double oneToThree){
    double unitOneToThree = 10* oneToThree + 3;
    return unitOneToThree;
}

double convertOneToFour(double oneToFour){
    double unitOneToFour = 10* oneToFour + 4;
    return unitOneToFour;
}
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;

@property (weak, nonatomic) IBOutlet UILabel *outField;

@end


@implementation ViewController

- (IBAction)updateButton:(id)sender {
    NSMutableString *buf = [NSMutableString new];
    
    double userInputField = [self.inputField.text doubleValue];
    
    if (self.segmentController.selectedSegmentIndex == 0) {
        double unitOneTounitTwo = convertOneToTwo(userInputField);
        [buf appendString: [@(unitOneTounitTwo) stringValue]];
    }
    else if (self.segmentController.selectedSegmentIndex == 1){
        double unitOnetoUnitThree = convertOneToThree(userInputField);
        [buf appendString: [@(unitOnetoUnitThree) stringValue]];
    }
    else{
        double unitOnetoUnitFour = convertOneToFour(userInputField);
        [buf appendString: [@(unitOnetoUnitFour) stringValue]];
    }
    self.outField.text = buf;
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
