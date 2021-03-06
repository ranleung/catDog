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
#import "SVProgressHUD.h"

@interface CatViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSOperationQueue *imageQueue;
@property (weak, nonatomic) NetworkController *sharedManager;
@property (strong, nonatomic) NSArray *gifs;
@property (strong, nonatomic) NSCache *imageCache;


@end

@implementation CatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sharedManager = [NetworkController sharedManager];
    
    [[self tableView] registerNib:[UINib nibWithNibName:@"AnimalCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ANIMAL_CELL"];
    
   [[NetworkController alloc] fetchGifsWithSearchTerm:@"cat" searchLimit:@"5" completionHandler:^(NSError *error, NSMutableArray *response) {
       self.gifs = response;
       [self.tableView reloadData];
   }];
    
//    self.tableView.estimatedRowHeight = 300;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.imageCache = [[NSCache alloc] init];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)backButton:(id)sender {
    HomeViewController *homeVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"HomeViewController"];
    [self presentViewController:homeVC animated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.gifs.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AnimalCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"ANIMAL_CELL" forIndexPath:indexPath];
    Gif *gif = self.gifs[indexPath.row];
    
    cell.imageViewCell.animatedImage = nil;
    NSInteger currentTag = cell.tag + 1;
    cell.tag = currentTag;
    
    if ([self.imageCache objectForKey:gif.gifURL]) {
        cell.imageViewCell.animatedImage = [self.imageCache objectForKey:gif.gifURL];
    } else {
        [self.sharedManager downloadImageForGifs:gif.gifURL completionHandler:^(NSError *error, FLAnimatedImage *image) {
            if ([self.tableView cellForRowAtIndexPath:indexPath]) {
                if (cell.tag == currentTag) {
                    [self.imageCache setObject:image forKey:gif.gifURL];
                    cell.imageViewCell.animatedImage = image;
                }
            }
        }];
    }

    return cell;
}


@end
