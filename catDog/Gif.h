//
//  Gif.h
//  catDog
//
//  Created by Randall Leung on 12/17/14.
//  Copyright (c) 2014 Randall Leung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FLAnimatedImage.h"

@interface Gif : NSObject

@property (strong, nonatomic) NSString *gifURL;
@property (strong, nonatomic) FLAnimatedImage *gifImage;

-(NSMutableArray *)parseJSONIntoGifs:(NSData *)rawJSONData;
-(instancetype)initWithDictionary: (NSDictionary *)gifDictionary;

@end
