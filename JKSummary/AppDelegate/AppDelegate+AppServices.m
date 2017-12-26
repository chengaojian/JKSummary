//
//  AppDelegate+AppServices.m
//  JKSummary
//
//  Created by 三海教育 on 2017/10/20.
//  Copyright © 2017年 JK. All rights reserved.
//

#import "AppDelegate+AppServices.h"
#import "YYFPSLabel.h"

@implementation AppDelegate (AppServices)

- (void)initWindow {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.mainTabBar = [[MainTabBarViewController alloc]init];
    self.window.rootViewController = self.mainTabBar;
    [self.window makeKeyAndVisible];
    // 防止按钮连续点击
    [[UIButton appearance] setExclusiveTouch:YES];
    // 苹果自带加载状态
}

- (void)initUserManager {
    
}

- (void)initFPS {
    YYFPSLabel *fpsLab = [[YYFPSLabel alloc]init];
    fpsLab.right = kScreenWith - 10;
    fpsLab.top = 30;
    [fpsLab sizeToFit];
    [self.window addSubview:fpsLab];
}

- (void)initLaunch {
    
    //设置你工程的启动页使用的是:LaunchImage 还是 LaunchScreen.storyboard(不设置默认:LaunchImage)
    [XHLaunchAd setLaunchSourceType:SourceTypeLaunchImage];
    
    //1.使用默认配置初始化
    XHLaunchVideoAdConfiguration *videoAdconfiguration = [XHLaunchVideoAdConfiguration defaultConfiguration];
    //广告视频URLString/或本地视频名(请带上后缀)
    videoAdconfiguration.videoNameOrURLString = @"party.mp4";
    //广告点击打开页面参数(openModel可为NSString,模型,字典等任意类型)
    videoAdconfiguration.openModel = @"http://www.it7090.com";
    //显示视频开屏广告
    [XHLaunchAd videoAdWithVideoAdConfiguration:videoAdconfiguration delegate:self];
}

@end
