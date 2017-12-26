//
//  HomeViewModel.h
//  KH2017
//
//  Created by 三海教育 on 2017/6/13.
//  Copyright © 2017年 三海教育. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeViewModel : NSObject

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *gmtCreated;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *detailUrl;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *gmtModified;

@end
