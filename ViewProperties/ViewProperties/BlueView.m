//
//  BlueView.m
//  ViewProperties
//
//  Created by macbook on 10/11/21.
//  Copyright © 2021 jaminya. All rights reserved.
//  Reference: iOS Programming: The Big Nerd Ranch Guide

#import "BlueView.h"

@implementation BlueView

- (void)drawRect:(CGRect)rect {
    
    CGRect bounds = self.bounds;
    CGPoint midPoint;
    midPoint.x = bounds.origin.x + bounds.size.width / 2.0;
    midPoint.y = bounds.origin.y + bounds.size.height / 2.0;
    float circleRadius = MIN(bounds.size.width - 10, bounds.size.height - 10) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path addArcWithCenter: midPoint
                    radius:circleRadius
                startAngle:0.0
                  endAngle: M_PI * 2.0
                 clockwise: YES
     ];
    path.lineWidth = 4;
    [[UIColor blueColor] setStroke];
    [path stroke];
}

// set a fixed content size so viewcontroller can center blueview in superview using autolayout
- (CGSize) intrinsicContentSize {
    CGRect bounds = self.bounds;
    
    float dimension = MIN(bounds.size.width - 4, bounds.size.height - 4);
    return CGSizeMake(dimension, dimension);
}

@end
