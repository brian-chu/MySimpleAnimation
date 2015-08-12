//
//  DrawImageView.m
//  MySimpleAnimation
//
//  Created by liqunfei on 15/8/10.
//  Copyright (c) 2015年 chuchengpeng. All rights reserved.
//

#import "DrawImageView.h"

@implementation DrawImageView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIGraphicsBeginImageContext(self.bounds.size);
    CGContextRef gc = UIGraphicsGetCurrentContext();
    CGAffineTransform transform = CGAffineTransformMakeTranslation(15, 10);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, &transform, CGRectMake(0, 0, 20, 20));
    CGPathAddEllipseInRect(path, &transform, CGRectMake(50, 0, 20, 20));
    CGPathMoveToPoint(path, &transform, 70, 35);
    CGPathAddArc(path, &transform, 35, 35, 35, 0, M_PI, NO);
    CGPathMoveToPoint(path, &transform, 30, 30);
    CGPathAddLineToPoint(path, &transform, 40, 30);
    CGContextAddPath(gc, path);
    [[UIColor blueColor] setStroke];
    CGContextSetLineWidth(gc, 2);
    CGContextStrokePath(gc);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    [self addSubview:imgView];
}


@end
