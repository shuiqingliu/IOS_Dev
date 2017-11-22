//
//  ViewController.m
//  TwitterShare
//
//  Created by qingliu on 11/22/17.
//  Copyright © 2017 qingliu. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;

- (void)configTweetTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configTweetTextView];
}

- (void)showAlertMessage:(NSString *) alertmessage{
    UIAlertController *customMsgAlert = [UIAlertController alertControllerWithTitle:@"TweetShare"
                                                                            message:alertmessage
                                                                     preferredStyle:UIAlertControllerStyleAlert];
    [customMsgAlert addAction:[UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:customMsgAlert animated:YES completion:nil];
}

- (IBAction)showShareAction:(id)sender {
    //if tweetTextView is the resonder then resign it
    if ( [self.tweetTextView isFirstResponder]) {
        [self.tweetTextView resignFirstResponder];
    }
    
    //create Alter Controller
    UIAlertController *shareAlert = [UIAlertController alertControllerWithTitle:@"Test Alert"
                                                                       message:@"TweetShareAlter"
                                                                preferredStyle:UIAlertControllerStyleAlert];
    
    //add action
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *tweetAction = [UIAlertAction actionWithTitle:@"Tweet" style:UIAlertActionStyleDefault handler:
                                  ^(UIAlertAction *action){
                                      if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
                                          //Tweet it
                                      }
                                      else{
                                          [self showAlertMessage:@"Please sign in to twitter before you tweet"];
                                      }
                                  } ];
    
    //add action to alter controller
    
    [shareAlert addAction:tweetAction];
    [shareAlert addAction:cancelAction];
    
    //Show alter controller
    [self presentViewController:shareAlert animated:YES completion:nil];
}


- (void)configTweetTextView{
    self.tweetTextView.layer.backgroundColor = [UIColor colorWithRed:1.0
                                                               green:1.0
                                                                blue:0.9
                                                               alpha:1.0].CGColor;
    self.tweetTextView.layer.cornerRadius = 10.0;
    self.tweetTextView.layer.borderWidth = 2.0;
    self.tweetTextView.layer.borderColor = [UIColor colorWithWhite:0 alpha:0.5].CGColor;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
