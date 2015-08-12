//
//  SecondViewController.h
//  MySimpleAnimation
//
//  Created by liqunfei on 15/8/7.
//  Copyright (c) 2015年 chuchengpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    COMBINATION_NONE,
    COMBINATION_POSITION,
    COMBINATION_SCALE,
    COMBINATION_COLOR,
    COMBINATION_ROTATION
}COMBINATION_ANIMATIONTYPE;

@interface SecondViewController : UIViewController
@property (assign,nonatomic) COMBINATION_ANIMATIONTYPE combination_animationType;
@end
