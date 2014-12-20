//
//  NetworkController.h
//  catDog
//
//  Created by Randall Leung on 12/17/14.
//  Copyright (c) 2014 Randall Leung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FLAnimatedImage.h"

@interface NetworkController : NSObject

@property (strong, nonatomic) NSURLSession *urlSession;
@property (strong, nonatomic) NSOperationQueue *operationQueue;

+ (instancetype)sharedManager;
-(void) fetchGifsWithSearchTerm:(NSString *)searchTerm searchLimit:(NSString *)searchLimit completionHandler: (void (^)(NSError *error, NSMutableArray *response))completionHanlder;
-(void) downloadImageForGifs:(NSString *)gifURL completionHandler:(void (^)(NSError *error, FLAnimatedImage *image))completionHandler;


@end
