//
//  NetWork.h
//  JKSummary
//
//  Created by 三海教育 on 2017/12/20.
//  Copyright © 2017年 JK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response.h"

@interface NetWork : NSObject

typedef void (^HttpSuccessBlock)(Response *response);
typedef void (^HttpFailedBlock)(NSError *error);

/**
 网络请求单例

 @return NetWork
 */
+ (NetWork *)shardInstance;

/**
 Get网络请求

 @param url 请求地址
 @param success 成功后的回调
 @param failed 失败后的回调
 */
- (void)httpRequestGetWithUrl:(NSString *)url success:(HttpSuccessBlock)success failed:(HttpFailedBlock)failed;

/**
 Post网络请求

 @param url 请求地址
 @param params 参数
 @param success 成功后的回调
 @param failed 失败后的回调
 */
- (void)httpRequestPostWithUrl:(NSString *)url params:(NSDictionary *)params success:(HttpSuccessBlock)success failed:(HttpFailedBlock)failed;

@end
