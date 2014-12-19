//
//  AnimalCell.h
//  catDog
//
//  Created by Randall Leung on 12/18/14.
//  Copyright (c) 2014 Randall Leung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLAnimatedImage.h"

@interface AnimalCell : UITableViewCell

@property (strong, nonatomic) NSString *testString;
@property (weak, nonatomic) IBOutlet FLAnimatedImageView *imageViewCell;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityInd;

@end