//
//  ViewController.m
//  ViewProperties
//
//  Created by macbook on 10/11/21.
//  Copyright © 2021 jaminya. All rights reserved.
//
//  Reference: https://stackoverflow.com/questions/14011395/ios-position-uiview-in-center-of-superview-using-auto-layout-programmatically

#import "ViewController.h"
#import "BlueView.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *blueView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect bounds = self.view.bounds;
    self.blueView = [[BlueView alloc] initWithFrame:bounds];
    self.blueView.backgroundColor = [UIColor whiteColor];
    
    self.blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.blueView];
    
    // center blueview in superview with autolayout constraints
    NSLayoutConstraint *blueViewXConstraints = [NSLayoutConstraint constraintWithItem:self.blueView
                                                                            attribute:NSLayoutAttributeCenterX
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:self.view
                                                                            attribute:NSLayoutAttributeCenterX
                                                                           multiplier:1.0
                                                                             constant:0];
    NSLayoutConstraint *blueViewYConstraints = [NSLayoutConstraint constraintWithItem:self.blueView
                                                                            attribute:NSLayoutAttributeCenterY
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:self.view
                                                                            attribute:NSLayoutAttributeCenterY
                                                                           multiplier:1.0
                                                                             constant:0];
    [self.view addConstraints:@[blueViewXConstraints, blueViewYConstraints]];
}

@end
