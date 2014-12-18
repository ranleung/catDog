//
//  LogInViewController.m
//  catDog
//
//  Created by Randall Leung on 12/16/14.
//  Copyright (c) 2014 Randall Leung. All rights reserved.
//

#import "LogInViewController.h"
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import "FLAnimatedImage.h"
#import "NetworkController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NetworkController alloc] fetchGifsWithSearchTerm:@"cat" completionHandler:^(NSError *error, NSMutableArray *response) {
        NSLog(@"%@", response);
    }];
    
    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://raphaelschaad.com/static/nyan.gif"]]];
    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
    imageView.animatedImage = image;
    imageView.frame = CGRectMake(100.0,100.0, 100.0, 100.0);
    [self.view addSubview:imageView];

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
