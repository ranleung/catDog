//
//  LogInViewController.m
//  catDog
//
//  Created by Randall Leung on 12/16/14.
//  Copyright (c) 2014 Randall Leung. All rights reserved.
//

#import "LogInViewController.h"
#import <ParseFacebookUtils/PFFacebookUtils.h>

@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}

- (IBAction)facebookButton:(id)sender {
    NSArray *permissions = @[@"public_profile"];

    [PFFacebookUtils logInWithPermissions:permissions block:^(PFUser *user, NSError *error) {
        if (!user) {
            NSLog(@"The user cancelled the Facebook login");
        } else if (user.isNew) {
            NSLog(@"User signed up and logged in through Facbeook");
            [self performSegueWithIdentifier:@"SHOWHOME" sender:self];
        } else {
            NSLog(@"User logged in through Facebook");
        }
    }];
}





@end
