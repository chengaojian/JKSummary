//
//  UserManager.m
//  JKSummary
//
//  Created by 三海教育 on 2017/12/20.
//  Copyright © 2017年 JK. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager

SINGLETON_FOR_CLASS(UserManager);

- (instancetype)init {
    self = [super init];
    if (self) {
        // 被踢下线
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(offLine) name:KNotificationOnKick object:nil];
    }
    return self;
}

- (void)offLine {
    // 退出登录
    [self loginOut:nil];
}

- (BOOL)loadUserInfo {
    YYCache *cache = [[YYCache alloc]initWithName:@"kUserCacheName"];
    NSDictionary *userDict = (NSDictionary *)[cache objectForKey:@"kUserModelCache"];
    if (userDict) {
        self.currUserInfo = [UserInfo modelWithJSON:userDict];
        return YES;
    }
    return NO;
}

- (void)autoLogin:(loginBlock)completion {
    
}

- (void)loginOut:(loginBlock)completion {
    
}

- (void)login:(UserLoginType)loginType completion:(loginBlock)completion {
    
}

- (void)login:(UserLoginType)loginType params:(NSDictionary *)params completion:(loginBlock)completion {
    
}

@end
