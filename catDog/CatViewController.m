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

@property (strong, nonatomic) NSOperationQueue *imageQueue;

@end

@implementation CatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self tableView] registerNib:[UINib nibWithNibName:@"AnimalCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ANIMAL_CELL"];
    
   [[NetworkController alloc] fetchGifsWithSearchTerm:@"cat" searchLimit:@"5" completionHandler:^(NSError *error, NSMutableArray *response) {
       self.gifs = response;
       [self.tableView reloadData];
   }];
    
//    self.tableView.estimatedRowHeight = 300;
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
    AnimalCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"ANIMAL_CELL"];
    cell.activityInd.hidden = NO;
    [cell.activityInd startAnimating];
    
    Gif *gif = self.gifs[indexPath.row];
    [self.imageQueue addOperationWithBlock:^{
        FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:[NSURL URLWithString:gif.gifURL]]];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            cell.imageViewCell.animatedImage = image;
        }];
    }];
    
    
    [cell.activityInd stopAnimating];
    cell.activityInd.hidden = YES;
    
    return cell;
}


@end
