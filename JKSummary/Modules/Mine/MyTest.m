//
//  MyTest.m
//  JKSummary
//
//  Created by 三海教育 on 2017/12/22.
//  Copyright © 2017年 JK. All rights reserved.
//

#import "MyTest.h"
#import <objc/runtime.h>
#import <objc/objc.h>

@interface MyTest ()

@property (nonatomic, copy) NSString *testName;
- (void)testInstanMethod1;
+ (void)testInstanMethod2;

@end

@implementation MyTest

- (void)testInstanMethod1 {
    NSLog(@"instance testInstanMethod1");
}

+ (void)testInstanMethod2 {
    NSLog(@"class testInstanMethod1");
}

@end
