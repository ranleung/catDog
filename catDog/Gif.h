//
//  Gif.h
//  catDog
//
//  Created by Randall Leung on 12/17/14.
//  Copyright (c) 2014 Randall Leung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Gif : NSObject

@property (strong, nonatomic) NSString *gifURL;

-(NSMutableArray *)parseJSONIntoGifs:(NSData *)rawJSONData;

@end
