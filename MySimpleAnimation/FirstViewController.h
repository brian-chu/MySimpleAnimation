//
//  FirstViewController.h
//  MySimpleAnimation
//
//  Created by liqunfei on 15/8/7.
//  Copyright (c) 2015年 chuchengpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    NONE,
    POSITION,
    OPACITY,
    SCALE,
    COLOR,
    RATATION
}ANIMATIONTYPE;
@interface FirstViewController : UIViewController
@property (assign,nonatomic) ANIMATIONTYPE animationType;
@end
