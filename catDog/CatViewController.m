//
//  CatViewController.m
//  catDog
//
//  Created by Randall Leung on 12/18/14.
//  Copyright (c) 2014 Randall Leung. All rights reserved.
//

#import "CatViewController.h"
#import "AnimalCell.h"
#import "HomeViewController.h"
#import "NetworkController.h"
#import "Gif.h"
#import "FLAnimatedImage.h"

@interface CatViewController () <UITableViewDelegate, UITableViewDataSource>


@end

@implementation CatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self tableView] registerNib:[UINib nibWithNibName:@"CatCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"CAT_CELL"];
    
   [[NetworkController alloc] fetchGifsWithSearchTerm:@"cat" searchLimit:@"10" completionHandler:^(NSError *error, NSMutableArray *response) {
       self.gifs = response;
       [self.tableView reloadData];
   }];
    
    self.tableView.estimatedRowHeight = 87;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}
- (IBAction)backButton:(id)sender {
    HomeViewController *homeVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"HomeViewController"];
    [self presentViewController:homeVC animated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.gifs.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AnimalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CAT_CELL"];
    Gif *gif = self.gifs[indexPath.row];
    
    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:[NSURL URLWithString:gif.gifURL]]];
    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
    imageView.animatedImage = image;
    imageView.frame = cell.imageView.frame;
    [self.view addSubview:imageView];
    

    return cell;
}


@end
