//
//  QLChildInfoCell.h
//  QLLoginModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLChildInfoCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "QLLoginUtil.h"

@implementation QLChildInfoItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 220;
        self.bgColor = [UIColor whiteColor];
        self.hasBottomLine = NO;
        self.canHighlighted = NO;
    }
    return self;
}

@end

@interface QLChildInfoCell()
{
}
@end

@implementation QLChildInfoCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    UILabel *haiInfo = [[UILabel alloc] initWithFrame:CGRectMake(24, 12, WTScreenWidth-24-23, 12)];
    haiInfo.font = WTFontSys(12);
    haiInfo.textColor = QL_DescColor_Gray;
    haiInfo.text = @"孩子信息";
    [self.contentView addSubview:haiInfo];

    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(24, haiInfo.bottom+12, WTScreenWidth-24-23, 184)];
    bgView.layer.cornerRadius = 2;
    bgView.layer.masksToBounds = YES;
    bgView.layer.borderColor = WTColorHex(0xECECE6).CGColor;
    bgView.layer.borderWidth = 1;
    [self.contentView addSubview:bgView];

    UIImageView *line1 = [[UIImageView alloc] initWithFrame:CGRectMake(12, 48, bgView.width-12-12, 1)];
    line1.backgroundColor = WTColorHex(0xEEEEE5);
    [bgView addSubview:line1];
    
    UIImageView *line2 = [[UIImageView alloc] initWithFrame:CGRectMake(12, 96, bgView.width-12-12, 1)];
    line2.backgroundColor = WTColorHex(0xEEEEE5);
    [bgView addSubview:line2];
    
    UIImageView *line3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 144, bgView.width, 1)];
    line3.backgroundColor = WTColorHex(0xEEEEE5);
    [bgView addSubview:line3];
    //清除信息
    UIButton *clearInfo = [[UIButton alloc] initWithFrame:CGRectMake(0, 145, bgView.width, 39)];
    [clearInfo setBackgroundImage:[WTUtil createImageFromColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    clearInfo.titleLabel.font = WTFontSys(12);
    [clearInfo setTitleColor:WTColorHex(0xFF6A18) forState:UIControlStateNormal];
    [clearInfo setTitle:@"清除信息" forState:UIControlStateNormal];
    [bgView addSubview:clearInfo];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
    self.backgroundColor = self.item.bgColor;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

@end
