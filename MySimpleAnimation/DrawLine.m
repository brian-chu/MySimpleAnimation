//
//  DrawLine.m
//  MySimpleAnimation
//
//  Created by liqunfei on 15/8/7.
//  Copyright (c) 2015年 chuchengpeng. All rights reserved.
//

#import "DrawLine.h"

@implementation DrawLine


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
//    self.pointArray = [NSMutableArray array];
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint point = [[self.pointArray lastObject] CGPointValue];
    self.endPoint = point;
    [path moveToPoint:CGPointMake(0, 300)];
    [path addLineToPoint:self.endPoint];
    [[UIColor redColor] setStroke];
    [path stroke];
   
}




@end
