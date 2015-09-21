//
//  UIView+ExpandView.m
//  CKExpandView
//
//  Created by C.K on 9/21/15.
//  Copyright © 2015 chenkun. All rights reserved.
//

#import "UIView+ExpandView.h"

@implementation UIView (ExpandView)

- (void)expand
{
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    
    aPath.lineCapStyle = kCGLineCapRound;
    aPath.lineJoinStyle = kCGLineCapRound;
    
    CGSize size = self.bounds.size;
    [aPath moveToPoint:CGPointMake(size.width / 2, 0)];
    [aPath addQuadCurveToPoint:CGPointMake(size.width, size.height / 2) controlPoint:CGPointMake(size.width, 0)];
    [aPath addQuadCurveToPoint:CGPointMake(size.width / 2, size.height) controlPoint:CGPointMake(size.width, size.height)];
    [aPath addQuadCurveToPoint:CGPointMake(0, size.height / 2) controlPoint:CGPointMake(0, size.height)];
    [aPath addQuadCurveToPoint:CGPointMake(size.width / 2, 0) controlPoint:CGPointMake(0, 0)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = aPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
