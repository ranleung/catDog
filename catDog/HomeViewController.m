//
//  HomeViewController.m
//  catDog
//
//  Created by Randall Leung on 12/17/14.
//  Copyright (c) 2014 Randall Leung. All rights reserved.
//

#import "HomeViewController.h"
#import "CatViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)catButton:(id)sender {
    NSLog(@"Cat");
    
    CatViewController *catVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CatViewController"];
    [self presentViewController:catVC animated:true completion:nil];
}

- (IBAction)dogButton:(id)sender {
    NSLog(@"Dog");
}



@end
