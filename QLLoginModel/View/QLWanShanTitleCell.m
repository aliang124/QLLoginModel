//
//  QLWanShanTitleCell.h
//  QLLoginModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLWanShanTitleCell.h"
#import "WTBaseCore.h"

@implementation QLWanShanTitleItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 120;
        self.bgColor = [UIColor whiteColor];
        self.hasBottomLine = NO;
        self.canHighlighted = NO;
    }
    return self;
}

@end

@interface QLWanShanTitleCell()
{
}
@end

@implementation QLWanShanTitleCell

- (void)cellDidLoad
{
    [super cellDidLoad];
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
