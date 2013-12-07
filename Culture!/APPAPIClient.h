//
//  APPAPIClient.h
//  Culture!
//
//  Created by Tim Leytens on 7/12/13.
//  Copyright (c) 2013 Tim Leytens. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface APPAPIClient : AFHTTPSessionManager <UIAlertViewDelegate>

+ (APPAPIClient *)sharedClient;

-(NSURLSessionDataTask *)getPath:(NSString *)path
                      parameters:(NSDictionary *)parameters
                      completion:(void (^)(NSArray *results, NSError *error))completion;


@end