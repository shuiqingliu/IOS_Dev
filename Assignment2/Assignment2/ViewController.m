//
//  ViewController.m
//  Assignment2
//
//  Created by qingliu on 10/21/17.
//  Copyright © 2017 qingliu. All rights reserved.
//

#import "ViewController.h"
#import "Tookit/RandomColor.h"

@interface ViewController ()
//statusLab
@property (weak, nonatomic) IBOutlet UILabel *statusLab;
//five gesture
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *TapGesture;
@property (strong, nonatomic) IBOutlet UIPinchGestureRecognizer *pinchGesture;
@property (strong, nonatomic) IBOutlet UIRotationGestureRecognizer *rotaionGesture;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGesture;
@property (strong, nonatomic) IBOutlet UILongPressGestureRecognizer *longPress;
@property (weak, nonatomic) IBOutlet UIImageView *monkey;
@property CGPoint *new;

@property (weak, nonatomic) IBOutlet UIButton *firstBtn;
@property (strong, nonatomic) UIScrollView *sv;
@end

@implementation ViewController

- (UIScrollView *)scrollView:(int)offSet{
    if(!_sv){
        _sv = [[UIScrollView alloc] init];
        CGFloat scrollX = [UIScreen mainScreen].bounds.size.width * offSet;
        CGFloat scrollY = 112;
        CGFloat scrollWidth = CGRectGetWidth(self.view.bounds);
        CGFloat scrollHeight = CGRectGetHeight(self.view.bounds) - 112;
        _sv.frame = CGRectMake(scrollX, scrollY, scrollWidth, scrollHeight);
        _sv.backgroundColor = [RandomColor randomColor];
        _sv.pagingEnabled = YES;
        self.firstBtn.backgroundColor = [RandomColor randomColor];
        
        //_sv.delegate = self;
        
        [self.view addSubview:_sv];
    }
    return _sv;
}

- (void)addScrollView{
    for(int i=0;i < 3;i++){
        [self scrollView:i];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.statusLab.text = @"屏幕按下";
    
    
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint position = [touch locationInView:self.view];
    self.statusLab.text = [NSString stringWithFormat:@"手指移动，%0.2f,%0.2f",position.x,position.y];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.statusLab.text = @"手指离开";
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.statusLab.text = @"触摸取消";
}
- (IBAction)tapGesture:(id)sender {
    
}
- (IBAction)pinchGesture:(id)sender {
}

- (IBAction)Rotaion:(id)sender {
    
}

- (IBAction)panGesture:(id)sender {
    
    
}
- (IBAction)longGesture:(id)sender {
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addScrollView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
