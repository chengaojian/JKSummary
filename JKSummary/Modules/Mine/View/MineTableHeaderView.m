//
//  MineTableHeaderView.m
//  JKSummary
//
//  Created by 三海教育 on 2017/12/22.
//  Copyright © 2017年 JK. All rights reserved.
//

#import "MineTableHeaderView.h"

@interface MineTableHeaderView ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *editLab;

@end

@implementation MineTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initTableHeaderView];
    }
    return self;
}

- (void)initTableHeaderView {
    [self addSubview:self.bgView];
    [self.bgView addSubview:self.headerImg];
    [self.bgView addSubview:self.nameLab];
    [self.bgView addSubview:self.editLab];
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWith, self.frame.size.height)];
    }
    return _bgView;
}

- (UIImageView *)headerImg {
    if (!_headerImg) {
        _headerImg = [[UIImageView alloc]initWithFrame:CGRectMake(25, 25, 80, 80)];
        [_headerImg sd_setImageWithURL:[NSURL URLWithString:@"https://static.edspay.com/borrow/1705280961308014-FFD8FF/view.html"]];
        _headerImg.backgroundColor = [UIColor redColor];
        _headerImg.layer.cornerRadius = 40;
        _headerImg.layer.masksToBounds = YES;
    }
    return _headerImg;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.headerImg.frame) + 15, 25, kScreenWith - 25 - 80 - 15 - 25, 40)];
        _nameLab.textAlignment = NSTextAlignmentLeft;
        _nameLab.text = @"陈高健";
        _nameLab.font = [UIFont systemFontOfSize:18];
    }
    return _nameLab;
}

- (UILabel *)editLab {
    if (!_editLab) {
        _editLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.headerImg.frame) + 15, CGRectGetMaxY(_nameLab.frame), kScreenWith - 25 - 80 - 15 - 25, 40)];
        _editLab.text = @"点击查看或编辑个人信息";
        _editLab.textAlignment = NSTextAlignmentLeft;
        _editLab.font = [UIFont systemFontOfSize:16];
        
    }
    return _editLab;
}

@end
