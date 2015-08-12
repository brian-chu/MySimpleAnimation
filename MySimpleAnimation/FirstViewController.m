//
//  FirstViewController.m
//  MySimpleAnimation
//
//  Created by liqunfei on 15/8/7.
//  Copyright (c) 2015年 chuchengpeng. All rights reserved.
//

#import "FirstViewController.h"
#import "DrawImageView.h"
@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIView *SquareView;
@property (weak, nonatomic) IBOutlet UIView *whiteSquareView;
@property (weak, nonatomic) IBOutlet UIView *blueSquareView;
@property (weak, nonatomic) IBOutlet UIImageView *rotationImage1;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DrawImageView *imgV = [[DrawImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    imgV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:imgV];
}

- (IBAction)beginAnimationBTN:(UIButton *)sender {
    [self getMyDefineAnimationType];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //[self getMyDefineAnimationType];
}

- (void)spin {
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.rotationImage1.transform = CGAffineTransformRotate(self.rotationImage1.transform, M_PI);
    } completion:^(BOOL finished) {
        [self spin];
    }];
 
}

- (void)getMyDefineAnimationType {
    switch (self.animationType) {
        case NONE:
        {
            NSLog(@"NONE");
        }
            break;
        case POSITION:
        {
            [UIView animateWithDuration:2.0 animations:^{
                CGFloat x = self.SquareView.center.x;
                CGFloat y = self.SquareView.center.y;
                x = self.view.bounds.size.width - x;
                y = self.view.bounds.size.height - self.SquareView.bounds.size.height/2;
                self.SquareView.center = CGPointMake(x, self.SquareView.center.y);
                self.whiteSquareView.center = CGPointMake(x, y-44.0);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:2.0 animations:^{
                    self.SquareView.center = CGPointMake(self.view.center.x, self.view.center.y-44.0);
                    self.whiteSquareView.center = CGPointMake(self.view.center.x, self.view.center.y-44.0);
                    
                } completion:^(BOOL finished){
                    [UIView animateWithDuration:2.0 animations:^{
                        [self.whiteSquareView.layer setCornerRadius:20];
                        self.whiteSquareView.bounds = CGRectMake(self.whiteSquareView.frame.origin.x, self.whiteSquareView.frame.origin.y, 100, 100);
                        self.whiteSquareView.alpha = 0.0;
                        self.SquareView.bounds = CGRectMake(self.whiteSquareView.frame.origin.x, self.whiteSquareView.frame.origin.y, 100, 100);
                        [self.SquareView.layer setCornerRadius:30];
                    } completion:^(BOOL finished) {
                        [UIView animateWithDuration:3.0 animations:^{
                            [self.SquareView.layer setCornerRadius:25];
                            self.SquareView.bounds = CGRectMake(self.whiteSquareView.frame.origin.x, self.whiteSquareView.frame.origin.y, 50, 50);
                        } completion:^(BOOL finished) {
                            
                        }];
                    }];
                   
                  }];
            }];
            
        }
            break;
        case SCALE:
        {
            NSLog(@"SCALE");
            [UIView animateWithDuration:1.0 animations:^{
                self.SquareView.transform = CGAffineTransformMakeScale(0.5, 0.5);
                self.whiteSquareView.alpha = 0.1;
                
            } completion:^(BOOL finished) {
               [self.view bringSubviewToFront:self.SquareView]; 
            }];
            
        }
            break;
        case OPACITY:
        {
            NSLog(@"OPACITY");
        }
            break;
        case COLOR:
        {
            NSLog(@"COLOR");
            [UIView animateWithDuration:2.5 animations:^{
                [self.blueSquareView setHidden:NO];
                self.blueSquareView.backgroundColor = [UIColor purpleColor];
                
            } completion:^(BOOL finished) {
   
        }];
        }
            break;
        case RATATION:
        {
            [self.view bringSubviewToFront:self.rotationImage1];
            [self.whiteSquareView setHidden:YES];
            [self.SquareView setHidden:YES];
            NSLog(@"TATATION");
            [self.rotationImage1 setHidden:NO];
            [self.rotationImage1.layer setCornerRadius:80];
            [self spin];
            
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
