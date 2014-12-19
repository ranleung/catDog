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
#import "Gif.h"

@interface LogInViewController ()

@property (strong,nonatomic) NSString *catGif;
@property (strong,nonatomic) NSString *dogGif;

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    [[NetworkController alloc] fetchGifsWithSearchTerm:@"cat" searchLimit:@"2" completionHandler:^(NSError *error, NSMutableArray *response) {
        
        Gif *gif = response[1];
        self.catGif = gif.gifURL;
        
        FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.catGif]]];
        FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
        imageView.animatedImage = image;
        imageView.frame = self.catImageView.frame;
        [self.view addSubview:imageView];
        
    }];
    
    [[NetworkController alloc] fetchGifsWithSearchTerm:@"dog" searchLimit:@"1" completionHandler:^(NSError *error, NSMutableArray *response) {
        
        Gif *gif = response[0];
        self.catGif = gif.gifURL;
        
        FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.catGif]]];
        FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
        imageView.animatedImage = image;
        imageView.frame = self.dogImageView.frame;
        [self.view addSubview:imageView];
        
    }];
    

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
            [self performSegueWithIdentifier:@"SHOWHOME" sender:self];
        }
    }];
}





@end
