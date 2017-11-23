## TwitterShare

A demo of twitterkit api 

### Login with logInWithCompletion (Objective-C)

```objective-c
[[Twitter sharedInstance] logInWithCompletion:^(TWTRSession *session, NSError *error) {
            if (session) {
                TWTRComposerViewController *composer = [TWTRComposerViewController emptyComposer];
                [composer initWithInitialText:[self.tweetTextView.text substringToIndex:140] image:nil videoURL:nil];
                [self presentViewController:composer animated:YES completion:nil];
            } else {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"No Twitter Accounts Available" message:@"You must log in before presenting a composer." preferredStyle:UIAlertControllerStyleAlert];
                [self presentViewController:alert animated:YES completion:nil];
            }
        }];
```
It will auto invoke the App of Twitter to auth the account

### Tweet with Composer

```objective-c
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
```

### Debug

Status error code 187 duplicate :means the tweet content already existed,accompanied by 403 forbidden .just change the content of tweet.