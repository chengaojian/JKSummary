//
//  LoginViewController.m
//  JKSummary
//
//  Created by 三海教育 on 2017/12/21.
//  Copyright © 2017年 JK. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNav];
    // Do any additional setup after loading the view.
}

- (void)setupNav {
    
    UIButton *closeBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 64)];
    [closeBtn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeBtn];
    
    // 测试按钮
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWith, kScreenHeight)];
    lab.text = @"登录页面";
    lab.textAlignment = NSTextAlignmentCenter;
    lab.textColor = kTestColor;
    lab.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:lab];
}

- (void)close {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"关闭登录页面");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
