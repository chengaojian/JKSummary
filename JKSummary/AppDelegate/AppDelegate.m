//
//  AppDelegate.m
//  JKSummary
//
//  Created by 三海教育 on 2017/10/20.
//  Copyright © 2017年 JK. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTest.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 初始化window
    [self initWindow];
    // 初始化用户管理系统
    [self initUserManager];
    // 显示FPS
    [self initFPS];
    // 配置启动图
    [self initLaunch];
    
    MyTest *mytest = [[MyTest alloc]init];
    
    Class cls = object_getClass(mytest);
    class_getName(cls);
    class_isMetaClass(cls);
    
    
    Class meta = object_getClass(cls);
    class_getName(meta);
    class_isMetaClass(meta);
    
    Class meta_meta = object_getClass(meta);
    class_getName(meta_meta);
    class_isMetaClass(meta_meta);
    
    kLog();
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    kLog();
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    kLog();
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    kLog();
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    kLog();
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
