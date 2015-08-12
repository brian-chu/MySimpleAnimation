//
//  LoginViewController.m
//  MySimpleAnimation
//
//  Created by liqunfei on 15/8/10.
//  Copyright (c) 2015年 chuchengpeng. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
{
    CGPoint centerOld;
    BOOL isFirst;
    UIActivityIndicatorView *activityView;
    CGPoint centerStill;
}
@property (weak, nonatomic) IBOutlet UIImageView *popImage1;
@property (weak, nonatomic) IBOutlet UIImageView *popImage2;
@property (weak, nonatomic) IBOutlet UIImageView *popImage3;
@property (weak, nonatomic) IBOutlet UIImageView *popImage4;
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwoedTextField;
@property (weak, nonatomic) IBOutlet UILabel *warningLabel;
@property (weak, nonatomic) IBOutlet UIButton *lohinBTN;
@property (weak, nonatomic) IBOutlet UILabel *loginTile;
@property (weak, nonatomic) IBOutlet UIImageView *titlePopImage;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [super viewDidLoad];
    isFirst = YES;
     self.popImage1.transform = CGAffineTransformMakeScale(0, 0);
     self.popImage2.transform = CGAffineTransformMakeScale(0, 0);
     self.popImage3.transform = CGAffineTransformMakeScale(0, 0);
     self.popImage4.transform = CGAffineTransformMakeScale(0, 0);
     self.accountTextField.leftViewMode = UITextFieldViewModeAlways;
        UIImageView *imgv = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, self.accountTextField.bounds.size.height-5, self.accountTextField.bounds.size.height-10)];
    self.accountTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(5, 5, self.accountTextField.bounds.size.height, self.accountTextField.bounds.size.height-10)];
    [self.accountTextField addSubview:imgv];
    imgv.image = [UIImage imageNamed:@"account_img"];
    self.passwoedTextField.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *imgv1 = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, self.accountTextField.bounds.size.height-5, self.accountTextField.bounds.size.height-10)];
    self.passwoedTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(5, 5, self.accountTextField.bounds.size.height, self.accountTextField.bounds.size.height-10)];
    [self.passwoedTextField addSubview:imgv1];
    imgv1.image = [UIImage imageNamed:@"password_img"];
    activityView.center = CGPointMake(activityView.center.x+15, activityView.center.y);
}

- (void)viewDidLayoutSubviews {
    CGPoint center = self.loginTile.center;
    center.x -= self.view.bounds.size.width;
    CGPoint center1 = self.passwoedTextField.center;
    center1.x -= self.view.bounds.size.width;
    CGPoint center2 = self.accountTextField.center;
    center2.x -= self.view.bounds.size.width;
    CGPoint center3 = self.lohinBTN.center;
    center3.x -= self.view.bounds.size.width;
    if (isFirst) {
        self.loginTile.center = center;
        self.titlePopImage.center = center;
        self.passwoedTextField.center = center1;
        self.accountTextField.center = center2;
        self.lohinBTN.center = center3;
        centerStill = self.lohinBTN.center;
    }
    else {
        self.titlePopImage.center = centerOld;
    }
    
    self.accountTextField.layer.cornerRadius = 5;
    self.passwoedTextField.layer.cornerRadius = 5;
    self.lohinBTN.layer.cornerRadius = 5;
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    isFirst = NO;
    CGPoint center1 = self.passwoedTextField.center;
    center1.x += self.view.bounds.size.width;
    CGPoint center2 = self.accountTextField.center;
    center2.x += self.view.bounds.size.width;
    CGPoint center3 = self.lohinBTN.center;
    center3.x += self.view.bounds.size.width;
    
    [UIView animateWithDuration:0.3 delay:0.2 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:nil animations:^{
        self.popImage3.transform = CGAffineTransformMakeScale(1, 1);
        self.popImage2.transform = CGAffineTransformMakeScale(1, 1);
        self.popImage4.transform = CGAffineTransformMakeScale(1, 1);
    } completion:^(BOOL finished) {
    }];
    
    [UIView animateWithDuration:0.3 delay:0.4 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:nil animations:^{
        self.popImage1.transform = CGAffineTransformMakeScale(1, 1);
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:1.0 delay:0.6 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:nil animations:^{
         centerOld = self.loginTile.center;
        centerOld.x += self.view.bounds.size.width;
        self.loginTile.center = centerOld;
    } completion:nil];
    
    [UIView animateWithDuration:3.0 delay:0.6 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:nil animations:^{
        centerOld.x = centerOld.x + self.loginTile.bounds.size.width*0.2+2;
        centerOld.y = centerOld.y - self.loginTile.bounds.size.height/2+3;
        self.titlePopImage.center = centerOld;
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.6 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.accountTextField.center = center2;
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:0.5 delay:0.6 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.passwoedTextField.center = center1;
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:0.7 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.lohinBTN.center = center3;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (IBAction)loginBtnAction:(id)sender {
    [activityView removeFromSuperview];
    [self.lohinBTN addSubview:activityView];
    [activityView startAnimating];
    self.lohinBTN.center = centerStill;
    self.lohinBTN.center = CGPointMake(self.lohinBTN.center.x-30, self.lohinBTN.center.y);
    [UIView animateWithDuration:1.5 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:0 options:nil animations:^{
        self.lohinBTN.center = CGPointMake(self.lohinBTN.center.x+30, self.lohinBTN.center.y);
    } completion:^(BOOL finished){
        
        [UIView animateWithDuration:0.3 animations:^{
            self.lohinBTN.center = CGPointMake(self.lohinBTN.center.x, self.lohinBTN.center.y+50);
        } completion:^(BOOL finished) {
            [activityView removeFromSuperview];
//           [UIView animateWithDuration:0.3 delay:1.5 options:nil animations:^{
//                self.lohinBTN.center = CGPointMake(self.lohinBTN.center.x, self.lohinBTN.center.y-50);
//           } completion:^(BOOL finished) {
//               [self.warningLabel setHidden:YES];
//           }];
            [UIView transitionWithView:self.warningLabel duration:0.3 options:UIViewAnimationOptionTransitionFlipFromTop | UIViewAnimationCurveEaseOut animations:^{
                [self.warningLabel setHidden:NO];
            } completion:^(BOOL finished) {
                
            }];
           
        }];
    }];
}



@end
