//
//  LoginController.m
//  Assignment2
//
//  Created by qingliu on 10/21/17.
//  Copyright © 2017 qingliu. All rights reserved.
//

#import "LoginController.h"

@interface LoginController ()
@property (strong, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation LoginController

//set testField only have bottom border
- (void)setUnderLine:(UIView *)view borderColor:(UIColor *)color borderWidth:(CGFloat)width{
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, view.frame.size.height - width, view.frame.size.width, width);
    layer.backgroundColor = color.CGColor;
    [view.layer addSublayer:layer];
}

//set UIImageView border is circle
- (void)setCircleHead:(UIImageView *)imageView{
    imageView.layer.cornerRadius = self.headImage.frame.size.width/2;
    imageView.layer.masksToBounds = YES;
    imageView.layer.borderWidth = 2.0f;
    imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    imageView.layer.
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.view.backgroundColor = [[UIColor blueColor]init];
    // Do any additional setup afte/r loading the view from its nib.
    //set circle head image
    [self setCircleHead:self.headImage];
    //set image for headCircle
    [self.headImage setImage:[UIImage imageNamed:@"apple" inBundle:nil compatibleWithTraitCollection:nil]];
    
    //set username and password border
    [self setUnderLine:self.username borderColor:[[UIColor blueColor]init] borderWidth:1.5f];
    [self setUnderLine:self.password borderColor:[[UIColor blueColor]init] borderWidth:1.5f];
    //set button property
    [self.loginButton setBackgroundColor:[[UIColor blueColor]init]];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
