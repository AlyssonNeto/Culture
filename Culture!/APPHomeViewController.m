//
//  APPHomeViewController.m
//  Culture!
//
//  Created by Tim Leytens on 7/12/13.
//  Copyright (c) 2013 Tim Leytens. All rights reserved.
//

#import "APPHomeViewController.h"
#import "KHFlatButton.h"
#import "APPContainerViewController.h"
#import "APPIntroViewController.h"

@interface APPHomeViewController ()

@property (nonatomic, strong) UIImageView *logo;
@property (nonatomic, strong) KHFlatButton *button1;
@property (nonatomic, strong) KHFlatButton *button2;
@property (nonatomic, strong) KHFlatButton *button3;
@property (nonatomic, strong) KHFlatButton *button4;

@end

@implementation APPHomeViewController

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

    self.title = @"Culture!";




}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    self.logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    self.logo.frame = CGRectMake(CENTER_IN_PARENT_X(self.view, WIDTH(self.logo)), 125, WIDTH(self.logo), HEIGHT(self.logo));
    self.logo.alpha = 0;
    [self.view addSubview:self.logo];

    self.button1 = [KHFlatButton buttonWithFrame:CGRectMake(CENTER_IN_PARENT_X(self.view, 250), BOTTOM(self.logo) + 125, 250, 50)
                                                withTitle:@"Het Huis van Alijn"
                                          backgroundColor:UIColorFromHex(0x2980b9)
                                             cornerRadius:4.0f];
    [self.button1 addTarget:self action:@selector(startQuiz:) forControlEvents:UIControlEventTouchUpInside];

    self.button1.alpha = 0;
    [self.view addSubview:self.button1];

    self.button2 = [KHFlatButton buttonWithFrame:CGRectMake(CENTER_IN_PARENT_X(self.view, 250), BOTTOM(self.button1) + 50, 250, 50)
                                                withTitle:@"Museum Dr. Guislain"
                                          backgroundColor:UIColorFromHex(0x2980b9)
                                             cornerRadius:4.0f];

    [self.button2 addTarget:self action:@selector(startQuiz:) forControlEvents:UIControlEventTouchUpInside];

    self.button2.alpha = 0;
    [self.view addSubview:self.button2];


    self.button3 = [KHFlatButton buttonWithFrame:CGRectMake(CENTER_IN_PARENT_X(self.view, 250), BOTTOM(self.button2) + 50, 250, 50)
                                                withTitle:@"S.M.A.K."
                                          backgroundColor:UIColorFromHex(0x2980b9)
                                             cornerRadius:4.0f];

    [self.button3 addTarget:self action:@selector(startQuiz:) forControlEvents:UIControlEventTouchUpInside];

    self.button3.alpha = 0;
    [self.view addSubview:self.button3];

    self.button4 = [KHFlatButton buttonWithFrame:CGRectMake(CENTER_IN_PARENT_X(self.view, 250), BOTTOM(self.button3) + 50, 250, 50)
                                                withTitle:@"Design museum Gent"
                                          backgroundColor:UIColorFromHex(0x2980b9)
                                             cornerRadius:4.0f];
    [self.button4 addTarget:self action:@selector(startQuiz:) forControlEvents:UIControlEventTouchUpInside];

    self.button4.alpha = 0;
    [self.view addSubview:self.button4];

    [UIView animateWithDuration:0.3
                          delay:0.1
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.logo.alpha = 1;
                     }
                     completion:^(BOOL finished){
                     }];

    [UIView animateWithDuration:0.2
                          delay:0.3
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.button1.alpha = 1;
                         self.button1.frame = CGRectMake(X(self.button1), Y(self.button1) - 50, WIDTH(self.button1), HEIGHT(self.button1));
                     }
                     completion:^(BOOL finished){
                     }];

    [UIView animateWithDuration:0.2
                          delay:0.5
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.button2.alpha = 1;
                         self.button2.frame = CGRectMake(X(self.button2), Y(self.button2) - 50, WIDTH(self.button2), HEIGHT(self.button2));
                     }
                     completion:^(BOOL finished){
                     }];

    [UIView animateWithDuration:0.2
                          delay:0.7
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.button3.alpha = 1;
                         self.button3.frame = CGRectMake(X(self.button3), Y(self.button3) - 50, WIDTH(self.button3), HEIGHT(self.button3));
                     }
                     completion:^(BOOL finished){
                     }];

    [UIView animateWithDuration:0.2
                          delay:0.9
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.button4.alpha = 1;
                         self.button4.frame = CGRectMake(X(self.button4), Y(self.button4) - 50, WIDTH(self.button4), HEIGHT(self.button4));
                     }
                     completion:^(BOOL finished){
                     }];

}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

    [self.logo removeFromSuperview];
    [self.button1 removeFromSuperview];
    [self.button2 removeFromSuperview];
    [self.button3 removeFromSuperview];
    [self.button4 removeFromSuperview];
}

-(void)startQuiz:(UIButton *)sender {

    APPIntroViewController *IntroVC = [[APPIntroViewController alloc] initWithNibName:nil bundle:nil];

    APPContainerViewController *VC = [[APPContainerViewController alloc] initWithRootViewController:IntroVC];
    
    [self.navigationController pushViewController:VC animated:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
