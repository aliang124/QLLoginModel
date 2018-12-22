//
//  QLSelectCheckButton.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/23.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLSelectCheckButton.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "QLLoginUtil.h"

@interface QLSelectCheckButton ()
@property (nonatomic,strong) UILabel *leftTextLabel;
@property (nonatomic,strong) UILabel *rightTextLabel;
@property (nonatomic,strong) UIImageView *arrowImg;
@end

@implementation QLSelectCheckButton

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundImage:[WTUtil createImageFromColor:WTColorHex(0xFAFAF7)] forState:UIControlStateNormal];
        self.backgroundColor = WTColorHex(0xFAFAF7);
        self.layer.cornerRadius = 2;
        self.layer.masksToBounds = YES;
        self.layer.borderColor = WTColorHex(0xECECE6).CGColor;
        self.layer.borderWidth = 1;
        
        _arrowImg = [[UIImageView alloc] initWithFrame:CGRectMake(self.width-16-7, 17, 7, 10)];
        [_arrowImg setImage:[UIImage imageNamed:@"arrowImg"]];
        [self addSubview:_arrowImg];
        
        _rightTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(_arrowImg.left-19, 0, 0, frame.size.height)];
        _rightTextLabel.font = WTFontSys(12);
        _rightTextLabel.textColor = QL_DescColor_Gray;
        [self addSubview:_rightTextLabel];

        _leftTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, 0, frame.size.height)];
        _leftTextLabel.font = WTFontSys(12);
        _leftTextLabel.textColor = QL_UserName_TitleColor_Black;
        [self addSubview:_leftTextLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _rightTextLabel.text = [WTUtil strRelay:self.rightText];
    [_rightTextLabel sizeToFit];
    float rightWidth = _rightTextLabel.width;
    _rightTextLabel.left = _arrowImg.left-rightWidth-16;
    _rightTextLabel.top = (self.height-_rightTextLabel.height)/2;
    _leftTextLabel.width = _rightTextLabel.left-16;
    _leftTextLabel.text = [WTUtil strRelay:self.leftText];
}
@end
