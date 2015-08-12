//
//  MainTableViewController.m
//  MySimpleAnimation
//
//  Created by liqunfei on 15/8/7.
//  Copyright (c) 2015年 chuchengpeng. All rights reserved.
//

#import "MainTableViewController.h"
#import "DefineAnimation.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "LoginViewController.h"
@interface MainTableViewController ()
{
    DefineAnimation *defineAnimation;
}
@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.delegate = (id<UINavigationControllerDelegate>)self;
    defineAnimation = [[DefineAnimation alloc] init];
}

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        return defineAnimation;
    }
    else
    {
        return nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return section == 0?5:4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainCell" forIndexPath:indexPath];
    NSArray *array = @[@"Position",@"Opacity",@"Scale",@"Color",@"Ratation"];
    if (indexPath.section == 0) {
        
    }
    else if (indexPath.section == 1) {
      array = @[@"CombinationPosition",@"Easing",@"Spring",@"Logining"];
    }
    cell.textLabel.text = array[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return section == 0?@"Simple":@"Combination";
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FirstViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"firstvc"];
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
            {
                vc.animationType = POSITION;
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 1:
            {
                vc.animationType = OPACITY;
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 2:
            {
                vc.animationType = SCALE;
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 3:
            {
                vc.animationType = COLOR;
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 4:
            {
                vc.animationType = RATATION;
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
                
            default:
            {
                vc.animationType = NONE;
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
        }
    }
    else if (indexPath.section == 1) {
        SecondViewController *secondVC = [self.storyboard instantiateViewControllerWithIdentifier:@"second"];
        switch (indexPath.row) {
            case 0:
            {
                
                secondVC.combination_animationType = COMBINATION_POSITION;
                [self.navigationController pushViewController:secondVC animated:YES];
            }
                break;
            case 1:
            {
                secondVC.combination_animationType = COMBINATION_SCALE;
                [self.navigationController pushViewController:secondVC animated:YES];
            }
                break;
            case 2:
            {
                secondVC.combination_animationType = COMBINATION_COLOR;
                [self.navigationController pushViewController:secondVC animated:YES];
            }
                break;
            case 3:
            {
                LoginViewController *loginView = [self.storyboard instantiateViewControllerWithIdentifier:@"login"];
//                secondVC.combination_animationType = COMBINATION_ROTATION;
                [self.navigationController pushViewController:loginView animated:YES];
            }
                break;
                
            default:
            {
                secondVC.combination_animationType = COMBINATION_NONE;
                [self.navigationController pushViewController:secondVC animated:YES];
            }
                break;
        }
    }
   
  
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    id segues = segue.destinationViewController;
//    UITableViewCell *cell = sender;
//    
//    NSLog(@"INDEX.ROW = %ld",(long)indexPath.row);
//    switch (indexPath.row) {
//        case 0:
//        {
//            [segues setValue:@"POSITION" forKey:@"animationType"];
//        }
//            break;
//        case 1:
//        {
//            [segues setValue:@"OPACITY" forKey:@"animationType"];
//        }
//            break;
//        case 2:
//        {
//            [segues setValue:@"SCALE" forKey:@"animationType"];
//        }
//            break;
//        case 3:
//        {
//            [segues setValue:@"COLOR" forKey:@"animationType"];
//        }
//            break;
//        case 4:
//        {
//            [segues setValue:@"RATATION" forKey:@"animationType"];
//        }
//            break;
//            
//        default:
//            [segues setValue:@"NONE" forKey:@"animationType"];
//            break;
//    }
}


@end
