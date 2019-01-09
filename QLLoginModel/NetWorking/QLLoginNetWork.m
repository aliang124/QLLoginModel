//
//  QLLoginNetWork.m
//  WTDemo
//
//  Created by 计恩良 on 2019/1/9.
//  Copyright © 2019年 计恩良. All rights reserved.
//
//获取验证码
#define QL_NetWorking_SendSMSMessage @"/sms/send-message"
//注册
#define QL_NetWorking_Register @"/register/index"

#import "QLLoginNetWork.h"

@implementation QLLoginNetWork
+ (void)SentSMSMessage:(NSString *)phone type:(NSString *)type successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler {
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:phone forKey:@"phone"];
    [param setObject:type forKey:@"type"];
    [QLNetWorkingUtil postDataWithHost:QL_Net_Host Path:QL_NetWorking_SendSMSMessage Param:param success:^(id json) {
        if (successHandler) {
            successHandler(json);
        }
    } fail:^(NSString *message) {
        if (failHandler) {
            failHandler(message);
        }
    }];
}

+ (void)registerWithPhone:(NSString *)phone password:(NSString *)pass code:(NSString *)code successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler {
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:phone forKey:@"phone"];
    [param setObject:pass forKey:@"password"];
    [param setObject:code forKey:@"code"];
    [QLNetWorkingUtil postDataWithHost:QL_Net_Host Path:QL_NetWorking_Register Param:param success:^(id json) {
        if (successHandler) {
            successHandler(json);
        }
    } fail:^(NSString *message) {
        if (failHandler) {
            failHandler(message);
        }
    }];
}
@end