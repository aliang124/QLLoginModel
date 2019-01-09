//
//  QLLoginInfo.h
//  QLBusiness
//
//  Created by jienliang on 14-4-28.
//  Copyright (c) 2014年 jienliang. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface QLLoginInfo : NSObject{
}
@property (nonatomic, copy) NSString *phone;//手机号
@property (nonatomic, copy) NSString *name;//用户名
//登录信息转换成对象
+ (QLLoginInfo *)loginInfoWithDict:(NSDictionary *)dInfo;
//获取存储在本地的登录文件路径
+ (NSString *)getUserInfoFile;
//写入本地登录文件路径
+ (void)writeUserInfo:(NSDictionary *)dic;
//获取用户信息
+ (QLLoginInfo *)getUserInfo;
//获取用户信息
+ (NSDictionary *)getUserDic;
//判断是否登录
+ (BOOL)isLogin;
@end
