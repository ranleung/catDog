//
//  NetworkController.h
//  catDog
//
//  Created by Randall Leung on 12/17/14.
//  Copyright (c) 2014 Randall Leung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkController : NSObject

@property (strong, nonatomic) NSURLSession *urlSession;
@property (strong, nonatomic) NSOperationQueue *operationQueue;

+ (instancetype)sharedManager;
-(void) fetchGifsWithSearchTerm:(NSString *)searchTerm completionHandler: (void (^)(NSError *error, NSMutableArray *response))completionHanlder;


@end
