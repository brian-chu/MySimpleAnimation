//
//  DrawLine.h
//  MySimpleAnimation
//
//  Created by liqunfei on 15/8/7.
//  Copyright (c) 2015年 chuchengpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawLine : UIView
@property (assign,nonatomic) CGPoint startPoint;
@property (assign,nonatomic) CGPoint endPoint;
@property (strong,nonatomic) NSMutableArray *pointArray;
@end
