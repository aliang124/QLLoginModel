//
//  QLBusinessUtil.h
//  WTDemo
//
//  Created by 计恩良 on 2018/12/22.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QLBusinessUtil : NSObject
+ (UITextField *)createTextFieldView:(CGRect)frame superView:(UIView *)superView placeHolder:(NSString *)place hasClear:(BOOL)hasClear;
+ (void)setPhoneTextViewBackGround:(UIView *)phoneOrNameView;
+ (void)setRoundBtn:(UIButton *)loginBtn titleText:(NSString *)titleText;
@end

NS_ASSUME_NONNULL_END
