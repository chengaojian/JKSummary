//
//  MineCell.h
//  JKSummary
//
//  Created by 三海教育 on 2017/12/21.
//  Copyright © 2017年 JK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineCell : UITableViewCell

@property (nonatomic, strong) UIView *lineView;

- (void)configMineCellWithTitle:(NSString *)title andMarkImageName:(NSString *)imageName;

@end