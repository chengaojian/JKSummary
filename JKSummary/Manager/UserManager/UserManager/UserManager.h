//
//  UserManager.h
//  Summary
//
//  Created by 三海教育 on 2017/12/20.
//  Copyright © 2017年 JK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"

typedef NS_ENUM(NSInteger, UserLoginType) {
    UserLoginTypeUnknow = 0,
    UserLoginTypeWeChat,
    UserLoginTypeQQ,
    UserLoginTypePwd,
};

typedef void(^loginBlock)(BOOL success, NSString *des);

#define isLogin [UserManager sharedUserManager].isLogined
#define currUser [UserManager sharedUserManager].currUserInfo
#define userManager [UserManager sharedUserManager]

@interface UserManager : NSObject

// 单例
SINGLETON_FOR_HEADER(UserManager)

// 当前用户
@property (nonatomic, strong) UserInfo *currUserInfo;
// 登录类型
@property (nonatomic, assign) UserLoginType *loginType;
// 是否已经登录
@property (nonatomic, assign) BOOL isLogined;

/**
 加载用户数据

 @return 是否成功
 */
- (BOOL)loadUserInfo;

/**
 自动登录

 @param completion 登录成功之后的回调
 */
- (void)autoLogin:(loginBlock)completion;

/**
 退出登录

 @param completion  退出登录成功之后的回调
 */
- (void)loginOut:(loginBlock)completion;

/**
 登录操作

 @param loginType 登录类型
 @param completion 完成登录之后的回调
 */
- (void)login:(UserLoginType)loginType completion:(loginBlock)completion;

/**
 带参登录操作

 @param loginType 登录类型
 @param params 参数
 @param completion 完成登录之后的回调
 */
- (void)login:(UserLoginType)loginType params:(NSDictionary *)params completion:(loginBlock)completion;



@end
