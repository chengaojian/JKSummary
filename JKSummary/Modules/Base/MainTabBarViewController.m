//
//  MainTabBarViewController.m
//  JKSummary
//
//  Created by 三海教育 on 2017/10/26.
//  Copyright © 2017年 JK. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "NetWork.h"
#import "HomeViewController.h"
#import "MineViewController.h"
#import "RootNavigationViewController.h"
#import "CategoryViewController.h"

@interface MainTabBarViewController () <UITabBarControllerDelegate>

@property (nonatomic, strong) NSMutableArray *vcs;

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    // 初始化TabBar
    [self initTabBar];
    // 添加子控制器
    [self initAddvc];
    
    // Do any additional setup after loading the view.
}

- (void)initTabBar {
//    self setValue:<#(nullable id)#> forKey:<#(nonnull NSString *)#>
    [self.tabBar setBackgroundColor:kNavBackgroundColor];
    [self.tabBar setBackgroundImage:[UIImage new]];
}

- (void)initAddvc {
    _vcs = @[].mutableCopy;
    HomeViewController *home = [[HomeViewController alloc]init];
    [self setupChildViewController:home title:@"首页" imageName:@"tab_home_nor" selectImageName:@"tab_home_sel"];
    
    CategoryViewController *category = [[CategoryViewController alloc]init];
    [self setupChildViewController:category title:@"精选" imageName:@"tab_video_nor" selectImageName:@"tab_video_sel"];
    
    MineViewController *mine = [[MineViewController alloc]init];
    [self setupChildViewController:mine title:@"我的" imageName:@"tab_mine_nor" selectImageName:@"tab_mine_sel"];
    
    self.viewControllers = _vcs;
}

- (void)setupChildViewController:(UIViewController *)controller title:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName {
    controller.title = title;
    controller.tabBarItem.title = title;
    controller.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [controller.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:kTabBarTitleNormalColor} forState:UIControlStateNormal];
    [controller.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:kTabBarTitleSelectColor} forState:UIControlStateSelected];
    // 外层添加导航控制器
    RootNavigationViewController *nav = [[RootNavigationViewController alloc]initWithRootViewController:controller];
    [_vcs addObject:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
