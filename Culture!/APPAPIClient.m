//
//  APPAPIClient.m
//  Culture!
//
//  Created by Tim Leytens on 7/12/13.
//  Copyright (c) 2013 Tim Leytens. All rights reserved.
//

#import "APPAPIClient.h"

@implementation APPAPIClient

+ (APPAPIClient *)sharedClient {
    static APPAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        NSURL *baseURL = [NSURL URLWithString:@"http://api.local/"];

        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];

        NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:10 * 1024 * 1024
                                                          diskCapacity:50 * 1024 * 1024
                                                              diskPath:nil];

        [config setURLCache:cache];

        _sharedClient = [[APPAPIClient alloc] initWithBaseURL:baseURL sessionConfiguration:config];
        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
    });

    return _sharedClient;
}

-(NSURLSessionDataTask *)getPath:(NSString *)path
                      parameters:(NSDictionary *)parameters
                      completion:(void (^)(NSArray *results, NSError *error))completion {

    NSURLSessionDataTask *task = [self GET:path
                                parameters:parameters
                                   success:^(NSURLSessionDataTask *task, id responseObject) {
                                       NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)task.response;
                                       if (httpResponse.statusCode == 200) {
                                           dispatch_async(dispatch_get_main_queue(), ^{
                                               completion(responseObject[@"response_data"], nil);
                                           });
                                       }
                                       else {
                                           dispatch_async(dispatch_get_main_queue(), ^{
                                               completion(nil, nil);
                                           });
                                       }
                                   } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            completion(nil, error);
                                        });
                                   }];
    return task;
}


@end
