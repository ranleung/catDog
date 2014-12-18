//
//  NetworkController.m
//  catDog
//
//  Created by Randall Leung on 12/17/14.
//  Copyright (c) 2014 Randall Leung. All rights reserved.
//

#import "NetworkController.h"
#import "Constants.h"
#import "Gif.h"

@interface NetworkController()

@end

@implementation NetworkController

#pragma mark - Init Methods

-(id)init{

    return self;
}

#pragma mark - Singleton

+ (instancetype)sharedManager {
    static NetworkController *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

#pragma mark - Fetch Methods

-(void) fetchGifsWithSearchTerm:(NSString *)searchTerm searchLimit:(NSString *)searchLimit completionHandler: (void (^)(NSError *error, NSMutableArray *response))completionHanlder {
    
    NSString *urlString = [NSString stringWithFormat:@"http://api.giphy.com/v1/gifs/search?q=%@&limit=%@&api_key=%@", searchTerm, searchLimit, kGiphyAPIKey];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.urlSession = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask *dataTask = [self.urlSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != nil) {
            NSLog(@"%@", error.localizedDescription);
        } else {
            if ([response isKindOfClass: [NSHTTPURLResponse class]]) {
                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                NSInteger statusCode = [httpResponse statusCode];
                if (statusCode >= 200 && statusCode <= 299) {
                    NSMutableArray *gifs = [[Gif alloc] parseJSONIntoGifs:data];
                    NSLog(@"Number of gifs found: %ld", (long)gifs.count);
                    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                        completionHanlder(nil, gifs);
                    }];
                } else if (statusCode >= 400 && statusCode <= 499) {
                    NSLog(@"Error! Status code is: %lu", statusCode);
                    NSLog(@"This is the clients fault");
                } else if (statusCode >= 500 && statusCode <= 599) {
                    NSLog(@"Error! Status code is: %lu", statusCode);
                    NSLog(@"This is the server's fault");
                } else {
                    NSLog(@"Something bad happened, Status Code: %ld", (long)statusCode);
                }
            }
        }
    }];
    [dataTask resume];
    
    
    
}

@end
