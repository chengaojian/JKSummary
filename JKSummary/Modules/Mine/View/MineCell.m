//
//  MineCell.m
//  JKSummary
//
//  Created by 三海教育 on 2017/12/21.
//  Copyright © 2017年 JK. All rights reserved.
//

#import "MineCell.h"

@interface MineCell ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UIImageView *markImg;
@property (nonatomic, strong) UIImageView *arrowImg;

@end

@implementation MineCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initCell];
    }
    return self;
}

- (void)initCell {
    [self.contentView addSubview:self.bgView];
    [self.bgView addSubview:self.titleLab];
    [self.bgView addSubview:self.markImg];
    [self.bgView addSubview:self.arrowImg];
    [self.bgView addSubview:self.lineView];
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWith, kMineCellHeight)];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(30, 0, kScreenWith - 70, kMineCellHeight)];
        _titleLab.text = @"";
        _titleLab.font = [UIFont systemFontOfSize:15];
    }
    return _titleLab;
}

- (UIImageView *)markImg {
    if (!_markImg) {
        _markImg = [[UIImageView alloc]initWithFrame:CGRectMake(10, (kMineCellHeight - 16) / 2, 16, 16)];
    }
    return _markImg;
}

- (UIImageView *)arrowImg {
    if (!_arrowImg) {
        _arrowImg = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWith - 25, (kMineCellHeight - 15) / 2, 15, 15)];
        _arrowImg.image = [UIImage imageNamed:@"arrow"];
    }
    return _arrowImg;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(30, kMineCellHeight - 1, kScreenWith - 40, 0.5)];
        _lineView.backgroundColor = kLineColor;
    }
    return _lineView;
}

- (void)configMineCellWithTitle:(NSString *)title andMarkImageName:(NSString *)imageName {
    _titleLab.text = title;
    _markImg.image = [UIImage imageNamed:imageName];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
