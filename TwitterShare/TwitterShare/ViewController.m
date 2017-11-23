//
//  ViewController.m
//  TwitterShare
//
//  Created by qingliu on 11/22/17.
//  Copyright © 2017 qingliu. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>
#import <TwitterKit/TwitterKit.h>

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
    
    [self sendTwitter:self.tweetTextView.text];
}

//send twitter,init composer
- (void)sendTwitter:(NSString *) twitterContent{
    if ([[Twitter sharedInstance].sessionStore hasLoggedInUsers]) {
        TWTRComposer *composer = [[TWTRComposer alloc]init];
        if ([twitterContent length] < 140) {
            [composer setText:twitterContent];
        }
        else{
            NSString *cutedString = [twitterContent substringToIndex:140];
            [composer setText:cutedString];
        }
        
        [composer showFromViewController:self completion:^(TWTRComposerResult result) {
            if (result == TWTRComposerResultCancelled) {
                NSLog(@"cacelled");
            }
            else{
                NSLog(@"sended");
            }
        }];
    }
    else{
        [[Twitter sharedInstance] logInWithCompletion:^(TWTRSession *session, NSError *error) {
            if (session) {
                TWTRComposerViewController *composer = [TWTRComposerViewController emptyComposer];
                NSString *tweetContent;
                if ([self.tweetTextView.text length] < 140) {
                    tweetContent = self.tweetTextView.text;
                }
                else{
                    tweetContent = [self.tweetTextView.text substringToIndex:140];
                }
                [composer initWithInitialText:tweetContent image:nil videoURL:nil];
                [self presentViewController:composer animated:YES completion:nil];
            } else {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"No Twitter Accounts Available" message:@"You must log in before presenting a composer." preferredStyle:UIAlertControllerStyleAlert];
                [self presentViewController:alert animated:YES completion:nil];
            }
        }];
    }
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
