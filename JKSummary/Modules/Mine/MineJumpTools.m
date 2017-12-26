//
//  MineJumpTools.m
//  JKSummary
//
//  Created by 三海教育 on 2017/12/22.
//  Copyright © 2017年 JK. All rights reserved.
//

#import "MineJumpTools.h"
#import "PreferencesViewController.h"
#import "FeedbackViewController.h"
#import "AboutUsViewController.h"

@implementation MineJumpTools

- (void)jumpPageWithNavigationController:(UINavigationController *)nav withClassName:(NSString *)className titleName:(NSString *)titleName {
    // 跳转到对应的页面
    UIViewController *vc = [[NSClassFromString(className) alloc]init];
    vc.title = titleName;
    nav.hidesBottomBarWhenPushed = YES;
    [nav pushViewController:vc animated:YES];
}

@end
