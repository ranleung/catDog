//
//  DogViewController.m
//  catDog
//
//  Created by Randall Leung on 12/20/14.
//  Copyright (c) 2014 Randall Leung. All rights reserved.
//

#import "DogViewController.h"
#import "HomeViewController.h"
#import "AnimalCell.h"
#import "NetworkController.h"

@interface DogViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) NetworkController *sharedManager;

@end

@implementation DogViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.sharedManager = [NetworkController sharedManager];
    
    [[self tableView] registerNib:[UINib nibWithNibName:@"AnimalCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ANIMAL_CELL"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (IBAction)backButton:(id)sender {
    HomeViewController *homeVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"HomeViewController"];
    [self presentViewController:homeVC animated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AnimalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ANIMAL_CELL" forIndexPath:indexPath];
    
    return cell;
}


@end
