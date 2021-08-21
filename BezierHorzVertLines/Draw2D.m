#import "Draw2D.h"

@implementation Draw2D

- (void)drawRect:(CGRect)rect {
    
    // name several screen dimensions
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat midPointX = screenSize.width / 2.0;
    CGFloat midPointY = screenSize.height / 2.0;
    CGFloat endPointY = screenSize.height;
    
    // draw red line vertically centered
    UIBezierPath *redline = [UIBezierPath bezierPath];
    [redline moveToPoint:CGPointMake(midPointX, 0)];
    [redline addLineToPoint:CGPointMake(midPointX, endPointY)];
    [[UIColor redColor] set]; //Set color to red
    [redline stroke];
    
    // draw blue line horizontally centered
    UIBezierPath *blueline = [UIBezierPath bezierPath];
    [blueline moveToPoint:CGPointMake(0, midPointY)];
    [blueline addLineToPoint:CGPointMake(screenSize.width, midPointY)];
    [[UIColor blueColor] set]; //Change color to blue
    [blueline stroke];
}

@end