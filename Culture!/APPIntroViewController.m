//
//  APPIntroViewController.m
//  Culture!
//
//  Created by Tim Leytens on 7/12/13.
//  Copyright (c) 2013 Tim Leytens. All rights reserved.
//

#import "APPIntroViewController.h"

@interface APPIntroViewController ()

@end

@implementation APPIntroViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
