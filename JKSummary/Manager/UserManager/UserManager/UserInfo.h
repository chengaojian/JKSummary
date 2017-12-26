//
//  UserInfo.h
//  JKSummary
//
//  Created by 三海教育 on 2017/12/20.
//  Copyright © 2017年 JK. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, UserGender) {
    UserGenderUnKnow = 0,
    UserGenderMale,
    UserGenderFemale
};

@interface UserInfo : NSObject

// 用户ID
@property (nonatomic, assign) long long userId;
// 头像
@property (nonatomic, copy) NSString *photo;
// 姓名
@property (nonatomic, copy) NSString *name;
// 昵称
@property (nonatomic, copy) NSString *nickName;
// 性别
@property (nonatomic, assign) UserGender sex;

@end
