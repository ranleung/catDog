//
//  CatViewController.m
//  catDog
//
//  Created by Randall Leung on 12/18/14.
//  Copyright (c) 2014 Randall Leung. All rights reserved.
//

#import "CatViewController.h"
#import "CatCell.h"
#import "HomeViewController.h"

@interface CatViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation CatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self tableView] registerNib:[UINib nibWithNibName:@"CatCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"CAT_CELL"];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
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

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CatCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CAT_CELL" forIndexPath:indexPath];
    
    return cell;
}


@end
