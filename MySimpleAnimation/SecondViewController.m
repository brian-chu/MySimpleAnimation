//
//  SecondViewController.m
//  MySimpleAnimation
//
//  Created by liqunfei on 15/8/7.
//  Copyright (c) 2015年 chuchengpeng. All rights reserved.
//

#import "SecondViewController.h"
#import "DrawLine.h"
@interface SecondViewController ()
{
    CGFloat x;
    CGFloat y;
    CGFloat w;
    CGFloat h;
    DrawLine *drawLine;
    CGPoint locationPoint;
}
@property (weak, nonatomic) IBOutlet UIView *oringeView;
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UIView *yellowView;
@property (weak, nonatomic) IBOutlet UIView *blockView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.yellowView.layer.anchorPoint = CGPointMake(0, 0);
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(changeCenter:)];
    [self.blueView addGestureRecognizer:pan];
    drawLine.startPoint = CGPointMake(0, self.yellowView.center.y);
}
- (IBAction)beginAnimationBTN:(UIButton *)sender {
    [self beginAnimation];
}

- (IBAction)reSetBTN:(UIButton *)sender {
    self.oringeView.center = CGPointMake(x,y);
    self.blueView.center = CGPointMake(x, y+h+40);
    self.greenView.center = CGPointMake(x, y+40*2+2*h);
    self.yellowView.center = CGPointMake(x, 3*40+3*h+y);
    NSLog(@"center.x = %lf",x);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    x = self.oringeView.center.x;
    y = self.oringeView.center.y;
    w = self.oringeView.bounds.size.width;
    h = self.oringeView.bounds.size.height;
}

- (void)changeCenter:(UIPanGestureRecognizer *)sender {
    CGPoint translation = [sender translationInView:self.view];
    sender.view.center = CGPointMake(sender.view.center.x+translation.x, sender.view.center.y+translation.y);
    [sender setTranslation:CGPointZero inView:self.view];
    
   // [self beginAnimation];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //self.view.layer.bounds = CGRectMake(0, 0, 200, 60);
    NSLog(@"anchorPoint = %lf--%lf",self.yellowView.layer.anchorPoint.x,self.yellowView.layer.anchorPoint.y);
    NSLog(@"yelloeview.center = %lf-%lf",self.yellowView.center.x,self.yellowView.center.y);
    [drawLine removeFromSuperview];
    drawLine = [[DrawLine alloc] initWithFrame:self.view.frame];
    drawLine.backgroundColor = [UIColor clearColor];
    drawLine.pointArray = [NSMutableArray array];
    UITouch *touch = [touches anyObject];
    //[self.yellowView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.yellowView.layer setMasksToBounds:YES];
    locationPoint = [touch locationInView:self.view];
    [drawLine.pointArray addObject:[NSValue valueWithCGPoint:self.yellowView.center]];
    [self.view addSubview:drawLine];
    [self.view sendSubviewToBack:drawLine];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = self.yellowView.center;
    point.x += [touch locationInView:self.view].x - locationPoint.x;
    point.y += [touch locationInView:self.view].y - locationPoint.y;
    self.yellowView.center = point;
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    self.yellowView.center = [touch locationInView:self.view];
}

- (void)beginAnimation {   
    switch (self.combination_animationType) {
        case COMBINATION_POSITION:
        {
           [UIView animateWithDuration:1.5 animations:^{
                self.oringeView.center = CGPointMake(self.view.bounds.size.width - x, y);
            } completion:^(BOOL finished) {
                
            }];
            [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionRepeat animations:^{
                self.blueView.center = CGPointMake(self.view.bounds.size.width - x, y+40+h);
            } completion:^(BOOL finished) {
                
            }];
            
            [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
                self.greenView.center = CGPointMake(self.view.bounds.size.width - x, y+40*2+h*2);
            } completion:^(BOOL finished) {
                
            }];
        }
            break;
        case COMBINATION_SCALE:
        {
            [UIView animateWithDuration:1.5 animations:^{
                self.oringeView.center = CGPointMake(self.view.bounds.size.width - x, y);
            } completion:^(BOOL finished) {
                
            }];
            
            [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                self.blueView.center = CGPointMake(self.view.bounds.size.width - x, y+40+h);
            } completion:^(BOOL finished) {
                
            }];
            
            [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.greenView.center = CGPointMake(self.view.bounds.size.width - x, y+2*40+2*h);
            } completion:^(BOOL finished) {
                
            }];
            
            [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.yellowView.center = CGPointMake(self.view.bounds.size.width - x, y+3*40+3*h);
            } completion:^(BOOL finished) {
                
            }];
            
        }
            break;
        case COMBINATION_COLOR:
        {
            [self.blockView setHidden:NO];
            [UIView animateWithDuration:1.5 animations:^{
                self.oringeView.center = CGPointMake(self.view.bounds.size.width - x, y);
            } completion:^(BOOL finished) {
                
            }]; 
            [UIView animateWithDuration:3.0 delay:0.0 usingSpringWithDamping:0.2 initialSpringVelocity:0.0 options:UIViewAnimationOptionTransitionNone animations:^{
                self.blueView.center = CGPointMake(self.blockView.frame.origin.x-w/2, y+40+h);
            } completion:^(BOOL finished) {
                
            }];
        }
            break;
        case COMBINATION_ROTATION:
        {
            
        }
            break;
            
        default:
        {
            
        }
            break;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
