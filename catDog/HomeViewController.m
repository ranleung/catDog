//
//  HomeViewController.m
//  catDog
//
//  Created by Randall Leung on 12/17/14.
//  Copyright (c) 2014 Randall Leung. All rights reserved.
//

#import "HomeViewController.h"
#import "CatViewController.h"
#import "DogViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)catButton:(id)sender {
    CatViewController *catVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CatViewController"];
    [self presentViewController:catVC animated:YES completion:nil];
}

- (IBAction)dogButton:(id)sender {
    DogViewController *dogVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"DogViewController"];
    [self presentViewController:dogVC animated:YES completion:nil];
}



@end
