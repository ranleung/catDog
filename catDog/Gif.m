//
//  Gif.m
//  catDog
//
//  Created by Randall Leung on 12/17/14.
//  Copyright (c) 2014 Randall Leung. All rights reserved.
//

#import "Gif.h"

@implementation Gif

-(id)init {
    self = [super init];
    return self;
}

-(instancetype)initWithDictionary: (NSDictionary *)gifDictionary {
    if (self == [super init]) {
        NSDictionary *images = [gifDictionary valueForKey:@"images"];
        self.gifURL = [images valueForKeyPath:@"fixed_height.url"];
    }
    return self;
}

-(NSMutableArray *)parseJSONIntoGifs:(NSData *)rawJSONData {
    NSError *error = nil;
    NSMutableArray *gifs = [[NSMutableArray alloc] init];
    NSDictionary *searchJSONDict = [NSJSONSerialization JSONObjectWithData:rawJSONData options:0 error:&error];
    for(NSDictionary *gifDict in searchJSONDict[@"data"]) {
        Gif *gifObject = [[Gif alloc] initWithDictionary:gifDict];
        [gifs addObject:gifObject];
    }
    return gifs;
}

@end
