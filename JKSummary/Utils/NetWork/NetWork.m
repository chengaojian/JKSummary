//
//  NetWork.m
//  JKSummary
//
//  Created by 三海教育 on 2017/12/20.
//  Copyright © 2017年 JK. All rights reserved.
//

#import "NetWork.h"
#import "Response.h"

@implementation NetWork

static NetWork *_shardInstance = nil;
+ (NetWork *)shardInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shardInstance = [[NetWork alloc]init];
    });
    return _shardInstance;
}

- (void)httpRequestGetWithUrl:(NSString *)url success:(HttpSuccessBlock)success failed:(HttpFailedBlock)failed {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json", nil];
    
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"down...");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success...");
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failure...");
        if (failed) {
            failed(error);
        }
    }];
}

- (void)httpRequestPostWithUrl:(NSString *)url params:(NSDictionary *)params success:(HttpSuccessBlock)success failed:(HttpFailedBlock)failed {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json", nil];
    
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"uploadProgress...");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject...");
        NSDictionary *resultData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        Response *response = [[Response alloc]init];
        response.data = [resultData objectForKey:@"data"];
        response.resCode = [resultData objectForKey:@"resCode"];
        response.resMsg = [resultData objectForKey:@"resMsg"];
        response.resTime = [resultData objectForKey:@"resTime"];
        if (success) {
            success(response);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error ---- >%@",error);
    }];
}

@end
