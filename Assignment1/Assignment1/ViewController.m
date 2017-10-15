//
//  ViewController.m
//  Assignment1
//
//  Created by qingliu on 10/13/17.
//  Copyright © 2017 qingliu. All rights reserved.
//

#import "ViewController.h"
#import "AlterViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *tapButton1;
@property (weak, nonatomic) IBOutlet UILabel *helloLable;
//custom button declare
@property (strong, nonatomic) UIButton *tapButton2;

@end

@implementation ViewController

//set UILable can display mutil lines
- (void) setHelloLable:(UILabel *)helloLable{
    NSString *screenSize = [NSString stringWithFormat:@"%f",[UIScreen mainScreen].bounds.size.width];
    NSLog(@"%@", screenSize);
    helloLable.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width;
    helloLable.numberOfLines = 0;
}

- (IBAction)clickMe:(id)sender {
    //set Lable title
    NSString *clickAgain = [NSString stringWithFormat:@"再点一次!"];
    [self.tapButton1 setTitle:clickAgain forState:(UIControlStateNormal)];
    printf("ClickCompleted");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //get screen width and height
    _tapButton1.layer.borderWidth = 1;
    _tapButton1.layer.cornerRadius = 5;
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width/2;
    CGFloat height = [UIScreen mainScreen].bounds.size.height/2;
    // invoke UIColorFromRGB(defined in .h file ) method to transform hex color to UIColor
    self.view.backgroundColor = UIColorFromRGB(0xe3f2fd);
    //set button size
    self.tapButton2 = [[UIButton alloc]initWithFrame:CGRectMake(120, 120, 60, 40)];
    //set button postion
    self.tapButton2.center = CGPointMake(width, height-5);
    self.tapButton2.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    //set button background image
    [self.tapButton2 setBackgroundImage:[UIImage imageNamed:@"hug_face"] forState:(UIControlStateNormal)];
    //define button click selector
    [self.tapButton2 addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    //add button to subView
    [self.view addSubview:_tapButton2];
    NSLog(@"第一个 view 加载 完毕");
}

//declare button selector
- (void)buttonClick{
    //creat instance alter view controller
    AlterViewController *alter = [[AlterViewController new]init];
    //when button clicked that set background image
    [self.tapButton2 setBackgroundImage:[UIImage imageNamed:@"heart_face"] forState:(UIControlStateNormal)];
    //set presentation modal is Over Current context
    alter.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    //alter.modalPresentationStyle = UIModalPresentationPopover;
    //add new view
    [self presentViewController:alter animated:YES  completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)loadView{
//    NSLog(@"第一个 storyboard 加载 view");
//}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"第一个控制器的 view 将要显示");
}

- (void)viewWillLayoutSubviews{
    NSLog(@"第一个控制器的 view 将要布局子控件");
}

- (void)viewDidLayoutSubviews{
    NSLog(@"第一个控制器的 view 布局子控件完成");
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"第一个控制器的 view 显示完毕");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"第一个控制器的 view 即将消失");
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"第一个控制器的 view 完全消失");
}



@end
