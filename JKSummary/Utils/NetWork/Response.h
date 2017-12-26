//
//  Response.h
//  JKSummary
//
//  Created by 三海教育 on 2017/12/20.
//  Copyright © 2017年 JK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Response : NSObject

@property (nonatomic, copy) NSDictionary *data;
@property (nonatomic, copy) NSString *resCode;
@property (nonatomic, copy) NSString *resMsg;
@property (nonatomic, copy) NSString *resTime;

@end
