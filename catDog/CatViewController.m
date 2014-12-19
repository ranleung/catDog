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

@property (strong, nonatomic) NSArray *testArray;

@end

@implementation CatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self tableView] registerNib:[UINib nibWithNibName:@"AnimalCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ANIMAL_CELL"];
    
   [[NetworkController alloc] fetchGifsWithSearchTerm:@"cat" searchLimit:@"10" completionHandler:^(NSError *error, NSMutableArray *response) {
       self.gifs = response;
       [self.tableView reloadData];
   }];
    
    self.testArray = @[@"Hello", @"Second", @"third"];
    
//    self.tableView.estimatedRowHeight = 200;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}
- (IBAction)backButton:(id)sender {
    HomeViewController *homeVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"HomeViewController"];
    [self presentViewController:homeVC animated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AnimalCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"ANIMAL_CELL"];
    Gif *gif = self.gifs[indexPath.row];
    
    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:[NSURL URLWithString:gif.gifURL]]];
//    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
//    imageView.animatedImage = image;
//    imageView.frame = cell.imageViewCell.frame;
//    [cell addSubview:imageView];
    
    cell.imageViewCell.animatedImage = image;

    //cell.testLabel.text = self.testArray[indexPath.row];
    
    return cell;
}


@end
