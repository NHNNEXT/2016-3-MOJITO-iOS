//
//  LoginViewController.m
//  mojito_project
//
//  Created by Jbee on 2016. 11. 9..
//  Copyright © 2016년 YongJai. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFieldUserEmail;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
- (IBAction)touchUpLoginButton:(id)sender {
    NSString * userEmail = _textFieldUserEmail.text;
    NSString * userPassword = _textFieldPassword.text;
    NSString * aURLString = @"http://125.209.195.85:8080/api/user/login/";
    NSURL * aURL = [NSURL URLWithString:aURLString];
    NSMutableURLRequest * aRequest = [NSMutableURLRequest requestWithURL:aURL];
    [aRequest setValue:@"application/json" forHTTPHeaderField: @"content-Type"];
    [aRequest setHTTPMethod:@"POST"];
    NSDictionary *aData = @{
                            @"userEmail" : userEmail,
                            @"userPassword" : userPassword
                            };
    
    [aRequest setHTTPBody:[NSJSONSerialization dataWithJSONObject:aData options:kNilOptions error:NULL]];

    NSHTTPURLResponse * aResponse;
    NSError * aError;
    NSData * aResultData = [NSURLConnection sendSynchronousRequest:aRequest returningResponse:&aResponse error:&aError];
    NSLog(@"login response = %ld", aResponse.statusCode);
    if(aResultData != nil) {
        NSDictionary * dataDictionary = [NSJSONSerialization JSONObjectWithData:aResultData options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"login result = %@", dataDictionary);
    }
}


@end
