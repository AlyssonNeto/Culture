//
//  APPContainerViewController.h
//  Culture!
//
//  Created by Tim Leytens on 7/12/13.
//  Copyright (c) 2013 Tim Leytens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APPContainerViewController : UIViewController

- (id)initWithRootViewController:(UIViewController *)rootViewController;

- (void)switchViewController:(NSString *)viewControllerIdentifier;

@end

@interface UIViewController (PageContainer)

@property (nonatomic, readonly) APPContainerViewController *pageContainer;

@end