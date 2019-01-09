//
//  QLLoginNetWork.m
//  WTDemo
//
//  Created by 计恩良 on 2019/1/9.
//  Copyright © 2019年 计恩良. All rights reserved.
//
#define QL_NetWorking_SendSMSMessage @"/sms/send-message"

#import "QLLoginNetWork.h"

@implementation QLLoginNetWork
+ (void)SentSMSMessage:(NSString *)phone type:(NSString *)type successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:phone forKey:@"phone"];
    [dic setObject:type forKey:@"type"];
    [QLNetWorkingUtil postDataWithHost:QL_Net_Host Path:QL_NetWorking_SendSMSMessage Param:dic success:^(id json) {
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
