//
//  APPContainerViewController.m
//  Culture!
//
//  Created by Tim Leytens on 7/12/13.
//  Copyright (c) 2013 Tim Leytens. All rights reserved.
//

#import "APPContainerViewController.h"
#import "APPIntroViewController.h"

@interface APPContainerViewController ()

@property (nonatomic, strong) UIViewController *rootViewController;

@end

@implementation APPContainerViewController

- (id)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super init];
    if (self) {
        self.rootViewController = rootViewController;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    if ([self.childViewControllers count] == 0) {
        [self.rootViewController willMoveToParentViewController:self];
        [self addChildViewController:self.rootViewController];

        UIView *rootView = self.rootViewController.view;
        rootView.frame = self.view.bounds;
        [self.view addSubview:rootView];
        [self.rootViewController didMoveToParentViewController:self];
    }

}

- (void)switchViewController:(NSString *)viewControllerIdentifier
{

    Class ViewControllerClass = NSClassFromString(viewControllerIdentifier);
    UIViewController *viewController = [[ViewControllerClass alloc] initWithNibName:nil bundle:nil];

    [viewController willMoveToParentViewController:self];
    [self addChildViewController:viewController];

    [self.view addSubview:viewController.view];

    [self.rootViewController willMoveToParentViewController:nil];

    [self transitionFromViewController:self.rootViewController
                      toViewController:viewController
                              duration:0.3
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:^{

                            }
                            completion:^(BOOL finished){
                                [self.rootViewController.view removeFromSuperview];
                                [self.rootViewController removeFromParentViewController];
                                self.rootViewController = viewController;
                            }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

@implementation UIViewController (PageContainer)

- (APPContainerViewController *)pageContainer {
    return (APPContainerViewController *)self.parentViewController;
}

@end